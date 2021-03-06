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
//   class DENG.CSVG_CIRCLE
// ===========================================================================================

DENG.CSVG_CIRCLE = function()
{
	super();
	
	this.cssPropAttr = {
		cx: true,
		cy: true,
		r: true,
		transform: true
	};
}

DENG.CSVG_CIRCLE.prototype = new DENG.CSVGWnd();

DENG.CSVG_CIRCLE.prototype.create = function()
{
	// create mc
	this.mc = this.mcContent = this.parentNode.mcContent.createEmptyMovieClipExt();
	this.mc.classRef = this.mcContent.classRef = this; // callback to this object
	
	super.create();
}


DENG.CSVG_CIRCLE.prototype.position = null;
DENG.CSVG_CIRCLE.prototype.size = null;


DENG.CSVG_CIRCLE.prototype.paint = function()
{
	var cx = this.resolveCssProperty("cx");
	var cy = this.resolveCssProperty("cy");
	var r = this.resolveCssProperty("r");

	this.mcContent._alpha = this.resolveCssProperty("opacity") * 100;
	var _fo = this.resolveCssProperty("fillopacity") * 100;
	var _fc = this.resolveCssPropertyColor("fill");
	if(_fc == "currentColor") {
		_fc = this.resolveCssPropertyColor("color");
	}
	var _sw = this.resolveCssProperty("strokewidth");
	var _so = this.resolveCssProperty("strokeopacity") * 100;
	var _sc = this.resolveCssPropertyColor("stroke");
	if(_sc == "currentColor") {
		_sc = this.resolveCssPropertyColor("color");
	}
	
	this.mcContent.clear();

	// paint circle (ellipse)
	// uses ZoodeGeometries2D package (drawing API abstraction)
	var svg_circle = new Ellipse2D(this.mcContent);
	svg_circle.setEllipse(cx, cy, r, r);
	if(_sc != "none") {
		svg_circle.setStroke(_sw, _sc, _so);
	} else {
		svg_circle.setStroke(0, 0, 0); // no stroke
	}
	if(_fc != "none") {
		svg_circle.setFillColor(_fc, _fo);
	} 
	svg_circle.draw();

	super.paint();
}

