/**
 * Created by kyle on 5/26/16.
 */

var React = require('react');
var ReactNative = require('react-native');
var {
  StyleSheet,
  Text,
  View,
  Animated,
  TouchableOpacity,
  Dimensions,
  } = ReactNative;

let PropTypes = React.PropTypes;
let width = window.width;

var styles = StyleSheet.create({
  actionButtonWrap: {
    width: width,
    marginLeft: 0,
    marginRight: 0
  },
  actionButton: {
    justifyContent: 'center',
    alignItems: 'center',
    flexDirection: 'row',
    paddingTop: 2,
    shadowOffset: {height: 1, width: 0},
    shadowOpacity: 0.3,
    shadowRadius: 2
  },
  actionTextView: {
    position: 'absolute',
    height: 26,
    width:  60,
    flex: 1 ,
    justifyContent: 'center',
    alignSelf: 'center',
    borderRadius: 4,
    backgroundColor: '#ffffff',
    shadowOffset: {height: 1, width: 0},
    shadowOpacity: 0.3,
    shadowRadius: 1
  },
  actionText: {
    fontSize: 13,
    justifyContent: 'center',
    alignSelf: 'center',
    color: "#707070"
  }
});

var ActionButtonItem = React.createClass ({
  getInitialState() {
    if (!this.props.children || Array.isArray(this.props.children)) {
      throw new Error("ActionButtonItem must have a Child component.");
    }
    let actionBtnWidth = this.props.actionItemSize > 0 ? this.props.actionItemSize : 56;
    let offsetRadius = (this.props.size-actionBtnWidth)/2.0+this.props.marginRightSpacing;
    return ({
      spaceBetween: this.props.spaceBetween,
      alignItems: this.props.alignItems,
      actionBtnWidth: actionBtnWidth,
      offsetRadius: offsetRadius
    });
  },

  render() {
    return (
      <Animated.View
        style={[styles.actionButtonWrap, {
          alignItems: this.state.alignItems,
          marginBottom: this.props.spacing,
          opacity: this.props.anim,
          transform: [{
            translateY: this.props.anim.interpolate({
              inputRange: [0, 1],
              outputRange: [40, 0]
            })
           }]
        }]}>
        <TouchableOpacity
          activeOpacity={this.props.activeOpacity || 0.85}
          onPress={this.props.onPress}>
          <View style={{
                    width: this.state.actionBtnWidth * 2 +26+ this.state.spaceBetween+this.state.offsetRadius,
                    height: this.state.actionBtnWidth,
                    marginRight: this.state.offsetRadius
                  }}>
            <View
              style={[styles.actionButton, this.props.style, {
                  width: this.state.actionBtnWidth,
                  height: this.state.actionBtnWidth,
                  borderRadius: this.state.actionBtnWidth / 2,
                  right: 0,
                  alignSelf:'flex-end',
                  backgroundColor: this.props.buttonColor || this.props.btnColor
                }]}>
              {this.props.children}
            </View>
            {
              !!this.props.title && (
                <View style={this.getTextStyles()}>
                  <Text style={styles.actionText}>{this.props.title}</Text>
                </View>
              )
            }
          </View>
        </TouchableOpacity>
      </Animated.View>
    );
  },

  getTextStyles() {
    let offsetTop = this.state.actionBtnWidth >= 28 ? (this.state.actionBtnWidth / 2) - 14 : 0;
    let positionStyles = {
      right: 25+this.state.actionBtnWidth,
      top: offsetTop
    };
    return [positionStyles,styles.actionTextView];
  }
});

ActionButtonItem.defaultProps = {
  spaceBetween: 25,
  alignItems: "flex-end",
  actionBtnWidth: 28
};

module.exports = ActionButtonItem;