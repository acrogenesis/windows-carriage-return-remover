{WorkspaceView} = require 'atom'
WindowsCarriageReturnRemover = require '../lib/windows-carriage-return-remover'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "WindowsCarriageReturnRemover", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('windows-carriage-return-remover')

  describe "when the windows-carriage-return-remover:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.windows-carriage-return-remover')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch atom.workspaceView.element, 'windows-carriage-return-remover:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.windows-carriage-return-remover')).toExist()
        atom.commands.dispatch atom.workspaceView.element, 'windows-carriage-return-remover:toggle'
        expect(atom.workspaceView.find('.windows-carriage-return-remover')).not.toExist()
