/*
 * VisualEditor user interface MWWikitextSwitchConfirmDialog class.
 *
 * @copyright 2011-2014 VisualEditor Team and others; see AUTHORS.txt
 * @license The MIT License (MIT); see LICENSE.txt
 */

/**
 * Dialog for letting the user choose how to switch to wikitext mode.
 *
 * @class
 * @extends OO.ui.MessageDialog
 *
 * @constructor
 * @param {OO.ui.WindowManager} manager Manager of window
 * @param {Object} [config] Configuration options
 */
ve.ui.MWWikitextSwitchConfirmDialog = function VeUiMWWikitextSwitchConfirmDialog( manager, config ) {
	// Parent constructor
	ve.ui.MWWikitextSwitchConfirmDialog.super.call( this, manager, config );
};

/* Inheritance */

OO.inheritClass( ve.ui.MWWikitextSwitchConfirmDialog, OO.ui.MessageDialog );

/* Static Properties */

ve.ui.MWWikitextSwitchConfirmDialog.static.name = 'wikitextswitchconfirm';

ve.ui.MWWikitextSwitchConfirmDialog.static.verbose = true;

ve.ui.MWWikitextSwitchConfirmDialog.static.size = 'small';

ve.ui.MWWikitextSwitchConfirmDialog.static.icon = 'help';

ve.ui.MWWikitextSwitchConfirmDialog.static.title =
	OO.ui.deferMsg( 'visualeditor-mweditmodesource-title' );

ve.ui.MWWikitextSwitchConfirmDialog.static.message =
	OO.ui.deferMsg( 'visualeditor-mweditmodesource-warning' );

ve.ui.MWWikitextSwitchConfirmDialog.static.actions = [
	{
		'action': 'cancel',
		'label': OO.ui.deferMsg( 'visualeditor-mweditmodesource-warning-cancel' ),
		'flags': 'safe'
	},
	{
		'action': 'switch',
		'label': OO.ui.deferMsg( 'visualeditor-mweditmodesource-warning-switch' ),
		'flags': 'primary'
	},
	{
		'action': 'discard',
		'label': OO.ui.deferMsg( 'visualeditor-mweditmodesource-warning-switch-discard' ),
		'flags': 'destructive'
	}
];

/* Methods */

/**
 * @inheritdoc
 */
ve.ui.MWWikitextSwitchConfirmDialog.prototype.getActionProcess = function ( action ) {
	if ( action === 'switch' || action === 'discard' ) {
		return new OO.ui.Process( function () {
			this.close( { 'action': action } );
		}, this );
	}

	// Parent method
	return ve.ui.MWWikitextSwitchConfirmDialog.super.prototype.getActionProcess.call( this, action );
};

/**
 * @inheritdoc
 */
ve.ui.MWWikitextSwitchConfirmDialog.prototype.getTeardownProcess = function ( data ) {
	data = data || {};
	return ve.ui.MWWikitextSwitchConfirmDialog.super.prototype.getTeardownProcess.call( this, data )
		.first( function () {
			// EVIL HACK - we shouldn't be reaching into the manager for these promises
			if ( data.action === 'switch' || data.action === 'discard' ) {
				this.manager.closing.resolve( data );
			} else {
				this.manager.closing.reject( data );
			}
		}, this );
};

/* Registration */

ve.ui.windowFactory.register( ve.ui.MWWikitextSwitchConfirmDialog );
