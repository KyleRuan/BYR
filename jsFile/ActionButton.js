/**
 * Created by kyle on 5/26/16.
 */
'use strict';
var React = require('react');
var ReactNative = require('react-native');
var PropTypes = React.PropTypes;
var {
    StyleSheet,
    Text,
    View,
    Animated,
    TouchableOpacity
} = ReactNative;
var  ActionButtonItem =  require('./ActionButtonItem');
const styles = StyleSheet.create({
  overlay: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    top: 0,
    justifyContent: 'flex-end',
    alignItems:"flex-end",
    backgroundColor: 'transparent'
  },
  actionBarItem: {
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: 'transparent'
  },
  btn: {
    justifyContent: 'center',
    alignItems: 'center',
    shadowOffset: {height: 0, width: 0},
    shadowOpacity: 0.3,
    shadowRadius: 2
  },
  btnText: {
    marginTop: -4,
    fontSize: 26,
    backgroundColor: 'transparent',
    position: 'relative'
  },
  actionsVertical: {
    flex: 1,
    justifyContent: 'flex-end',
    flexDirection: 'column',
    marginBottom: 60
  }
});

var ActionButton = React.createClass({
  getInitialState() {
    return ({
      active: this.props.active,
      type: this.props.type,
      bgColor: this.props.bgColor,
      buttonColor: this.props.buttonColor,
      buttonTextColor: this.props.buttonTextColor,
      spacing: this.props.spacing,
      btnOutRange: this.props.btnOutRange || this.props.buttonColor || 'rgba(0 , 0, 0, 1)',
      btnOutRangeTxt: this.props.btnOutRangeTxt || this.props.buttonTextColor || 'rgba(255, 255, 255, 1)',
      outRangeScale: this.props.outRangeScale,
      anim: new Animated.Value(this.props.active ? 1 : 0),
      backdrop: this.props.backdrop,
      event: "box-none",
      size: this.props.size,
      offsetY: this.props.offsetY,
      offsetX: this.props.offsetX,
      actionItemSize: this.props.actionItemSize,
      marginRightSpacing: this.props.marginRightSpacing
    });
  },

  componentWillUnmount() {
    clearTimeout(this.timeout);
  },
  getActionButtonStyles() {
    return [styles.actionBarItem, this.getButtonSize(),this.getOffsetXY()];
  },

  getButtonSize() {
    return {
      width: this.state.size,
      height: this.state.size
    }
  },

  getOffsetXY() {
    return {
      marginRight: this.state.marginRightSpacing,
      bottom: this.state.offsetY
    };
  },

  getActionsPosition() {
    return {
      paddingBottom: this.state.size+30
    }
  },
  getActionsStyle() {
    return [styles.overlay,this.getActionsPosition()];
  },

  render() {
    return (
        <View pointerEvents={this.state.event}
              style={styles.overlay}>
          <Animated.View pointerEvents={this.state.event}
                         style={[styles.overlay,
                       {
                         backgroundColor: this.state.bgColor,
                         opacity: this.state.anim
                       }]}>
            {this.props.backdrop}
          </Animated.View>
          <View pointerEvents={this.state.event}
                style={styles.overlay}>
            {this.props.children && this._renderActions()}
            {this._renderButton()}
          </View>
        </View>
    );
  },

  _renderButton() {
    return (
        <View style={this.getActionButtonStyles()}>
          <TouchableOpacity
              activeOpacity={0.85}
              onLongPress={this.props.onLongPress}
              onPress={() => {
            this.props.onPress();
            if (this.props.children) {
              this.animateButton();
            }
          }}>
            <Animated.View
                style={[styles.btn, {
              width: this.state.size,
              height: this.state.size,
              borderRadius: this.state.size / 2,
              backgroundColor: this.state.anim.interpolate({
                inputRange: [0, 1],
                outputRange: [this.state.buttonColor, this.state.btnOutRange]
              }),
              transform: [{
                  scale: this.state.anim.interpolate({
                    inputRange: [0, 1],
                    outputRange: [1, this.state.outRangeScale]
                  })
                }, {
                  rotate: this.state.anim.interpolate({
                    inputRange: [0, 1],
                    outputRange: ['0deg', this.props.icon ? '0deg' : '135deg']
                  })
                }]
            }]}>
              {this._renderButtonIcon()}
            </Animated.View>
          </TouchableOpacity>
        </View>
    );
  },
  _renderButtonIcon() {
    if (this.props.icon) {
      return this.props.icon;
    }

    return (
        // TODO: "+" whether change to pic
        <Animated.Text style={[styles.btnText, {
        color: this.state.anim.interpolate({
          inputRange: [0, 1],
          outputRange: [this.state.buttonTextColor, this.state.btnOutRangeTxt]
        })
      }]}>
          +
        </Animated.Text>
    );
  },

  _renderActions() {
    if (!this.state.active) {
      return null;
    }
    let actionButtons = this.props.children;
    if (!Array.isArray(this.props.children)) {
      actionButtons = [this.props.children];
    }

    return (
        <TouchableOpacity
            style={this.getActionsStyle()}
            activeOpacity={1}
            onPress={() => this.reset()}>
          {actionButtons.map((ActionButton, index) => {
            return (
                <ActionButtonItem
                    key={index}
                    spacing={this.state.spacing}
                    anim={this.state.anim}
                    actionItemSize={this.state.actionItemSize}
                    circleOffsetX={this.state.offsetX/2}
                    size={this.state.size}
                    btnColor={this.state.btnOutRange}
                    marginRightSpacing={this.state.marginRightSpacing}
                    {...ActionButton.props}
                    onPress={() => {
                  if (this.props.autoInactive) {
                    this.timeout = setTimeout(() => {
                      this.reset();
                    }, 200);
                  }
                  ActionButton.props.onPress();
                }}
                />
            );
          })}
        </TouchableOpacity>
    );
  },

  animateButton() {
    if (this.state.active) {
      return this.reset();
    }

    this.setState({
      event:"auto"
    });

    Animated.spring(this.state.anim, {
      toValue: 1,
      duration: 250
    }).start();

    this.setState({
      active: true
    });
  },

  reset() {
    Animated.spring(this.state.anim, {
      toValue: 0,
      duration: 250
    }).start();

    this.setState({
      event:"box-none"
    });

    setTimeout(() => {
      this.setState({
        active: false
      });
    }, 250);
  }
});

ActionButton.Item = ActionButtonItem;

ActionButton.propTypes = {
  active: PropTypes.bool,
  type: PropTypes.oneOf(['float', 'tab']),
  bgColor: PropTypes.string,
  buttonColor: PropTypes.string,
  buttonTextColor: PropTypes.string,
  marginRightSpacing: PropTypes.number,
  offsetX : PropTypes.number,
  offsetY: PropTypes.number,
  spacing: PropTypes.number,
  size: PropTypes.number,
  actionItemSize: PropTypes.number,
  autoInactive: PropTypes.bool,
  onPress: PropTypes.func,
  backdrop: PropTypes.oneOfType([
    PropTypes.bool,
    PropTypes.object
  ])
};

ActionButton.defaultProps = {
  active: false,
  type: 'float',
  bgColor: 'rgba(255,255,255,0.88)',
  buttonColor: 'rgba(231,76,60,1)',
  buttonTextColor: 'rgba(255,255,255,1)',
  spacing: 20,
  outRangeScale: 1,
  autoInactive: true,
  onPress: () => {},
  backdrop: false,
  offsetX:10,
  offsetY:30,
  size: 50,
  actionItemSize: 25,
  marginRightSpacing: 24
};

module.exports = ActionButton;