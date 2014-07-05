#ui-switch
On and off with a sliding motion.


    Polymer 'ui-switch',

##Events
###change
Fires when the check goes on or off.

##Attributes and Change Handlers
###checked
This is a nice `true` or `false` attribute to make data binding easier.

      checked:
        value: false
        reflect: true
      checkedChanged: ->
        if @checked
          @$.check.setAttribute 'checked', ''
          @setAttribute 'on', ''
        else
          @$.check.removeAttribute 'checked'
          @removeAttribute 'on'
        @fire 'change'

##Methods

##Event Handlers
Check and focus handling, these attributes are used as flags
to control formatting.

      onChange: ->
        @checked = @$.check.checked

      onFocus: ->
        @setAttribute 'focused', ''

      onBlur: ->
        @removeAttribute 'focused'

This is a bit tricky -- need to have a click handler on the whole element
so that we can catch clicks on the `content` to have a large hit area. But, clicks
in the rest of the control bubble too, so we need to eat those before they bubble.

      onContentClick: (evt) ->
        @checked = not @checked

      onSwitchClick: (evt) ->
        evt.stopPropagation()

##Polymer Lifecycle

      created: ->

      ready: ->

      attached: ->

      domReady: ->

      detached: ->
