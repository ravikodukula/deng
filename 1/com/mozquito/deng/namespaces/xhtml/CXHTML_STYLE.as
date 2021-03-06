/*
DENG Modular XBrowser
Copyright (C) 2002-2004 Mozquito

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*/

// ===========================================================================================
//   class DENG.CXHTML_STYLE
// ===========================================================================================

DENG.CXHTML_STYLE = function() { super(); }

DENG.CXHTML_STYLE.prototype = new DENG.CWnd();


DENG.CXHTML_STYLE.prototype.initialize = function(node, parent)
{
	// initialize element wrapper
	super.initialize(node, parent);
	// if child is a text node (internal stylesheet)
	if(this.node.firstChild.nodeType == 3) {
		// add internal stylesheet to queue
		this.xmlDomRef.cssParseQueue.push({ type: 1, css: this.node.firstChild.nodeValue });
	}
}

