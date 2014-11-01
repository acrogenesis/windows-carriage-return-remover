module.exports =
  activate: ->
    atom.workspaceView.command "windows-carriage-return:remove", => @remove()

  remove: ->
    editor = atom.workspace.getActivePaneItem()
    editor.setText(editor.getText().replace(/(\r\n|\n|\r)/gm,"\n"))
