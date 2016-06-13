'use strict';

var ReactNative = require('react-native');
var React = require('react');
var ActionButton = require('./jsFile/ActionButtonView');
var styles = require('./jsFile/Styles.js');
var {
  Text,
  View,
  AppRegistry,
  StyleSheet
} = ReactNative;


class SimpleApp extends React.Component {
  render() {
    return (
   
        <ActionButton></ActionButton>
    )
  }
};

AppRegistry.registerComponent('SimpleApp', () => SimpleApp);
