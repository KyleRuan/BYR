/**
 * Created by ruankai on 6/13/16.
 */

var React = require('react');
var ReactNative = require('react-native');
var {
  View
} = ReactNative;
var ActionButton = require('../jsFile/ActionButton.js');
var styles = require('../jsFile/Styles.js');
let width = window.width;


var ActionButtonView = React.createClass ({
  
  
  
  renderActionView: function () {
    var  buttonGroup = [
      {
        title:"发帖",
        buttonColor: "#4285f4",
        // imagePath: require('../../image/button_w.png'),
        onClick: null
      },
      {
        title:"搜索",
        buttonColor: "#4285f4",
        // imagePath: require('../../image/button_w.png'),
        onClick: null
      },
    ];
    var buttons = buttonGroup.map((button ,i)=>{this.renderActionItem.bind(this,button,i)});
    return (
        {buttons}
    );
  },

  renderActionItem: function (button,i) {
    return (
      <ActionButton.Item
        key={i}
        buttonColor={button.buttonColor}
        title={button.title}
        actionItemSize={36}
        onPress={button.onClick}>
      </ActionButton.Item>
    );
  },

  render() {
    var buttons = this.renderActionView();
    return (
      <ActionButton size={50}>
        {buttons}
      </ActionButton>
    );
  },



});



module.exports = ActionButtonView;