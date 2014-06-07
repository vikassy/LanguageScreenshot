/*!
 * VisualEditor ContentEditable MWHieroNode class.
 *
 * @copyright 2011-2014 VisualEditor Team and others; see AUTHORS.txt
 * @license The MIT License (MIT); see LICENSE.txt
 */

/**
 * ContentEditable MediaWiki hieroglyphics node.
 *
 * @class
 * @extends ve.ce.MWBlockExtensionNode
 *
 * @constructor
 * @param {ve.dm.MWHieroNode} model Model to observe
 * @param {Object} [config] Configuration options
 */
ve.ce.MWHieroNode = function VeCeMWHieroNode( model, config ) {
	// Parent constructor
	ve.ce.MWBlockExtensionNode.call( this, model, config );

	// DOM changes
	this.$element.addClass( 've-ce-mwHieroNode' );
};

/* Inheritance */

OO.inheritClass( ve.ce.MWHieroNode, ve.ce.MWBlockExtensionNode );

/* Static Properties */

ve.ce.MWHieroNode.static.name = 'mwHiero';

ve.ce.MWHieroNode.static.tagName = 'div';

ve.ce.MWHieroNode.static.primaryCommandName = 'hiero';

/* Registration */

ve.ce.nodeFactory.register( ve.ce.MWHieroNode );
