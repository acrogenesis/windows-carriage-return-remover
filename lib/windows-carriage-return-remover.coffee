module.exports =
  config:
    formatOnSave:
      type: 'boolean'
      default: false
      description: 'Remove carriage returns automatically on save'
  activate: ->
    atom.commands.add 'atom-workspace', "windows-carriage-return:remove": => @remove()
    atom.workspace.observeTextEditors (editor) => @handleSave(editor)
  remove: ->
    editor = atom.workspace.getActivePaneItem()
    editor.setText(editor.getText().replace(/(\r\n|\n|\r)/gm,"\n"))
  handleSave: (editor) ->
    buffer = editor.getBuffer()
    @subscription = buffer.onWillSave =>
      if atom.config.get('windows-carriage-return-remover.formatOnSave') is true
        @remove()
