React = require 'react'
PureRenderMixin = require 'react-addons-pure-render-mixin'

div  = React.createFactory 'div'
span = React.createFactory 'span'

module.exports = React.createClass
  displayName: 'no-content'
  mixins: [PureRenderMixin]

  propTypes:
    tip: React.PropTypes.string.isRequired

  render: ->
    div className: 'no-content',
      span className: "icon icon-circle-warning"
      div className: "tip", @props.tip
