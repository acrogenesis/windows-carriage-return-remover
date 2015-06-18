module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', "windows-carriage-return:remove": => @remove()
  remove: ->
    editor = atom.workspace.getActivePaneItem()
    editor.setText(editor.getText().replace(/(\r\n|\n|\r)/gm,"\n"))
