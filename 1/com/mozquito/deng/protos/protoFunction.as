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
//   Function Prototypes
// ===========================================================================================

Function.prototype.extend = function(superClass)
{
	// this method is used for __proto__ based inheritance
	// reference: http://www.quantumwave.com/flash/inheritance.html 
	this.prototype.__proto__ = superClass.prototype;
	this.prototype.__constructor__ = superClass;
	ASSetPropFlags(this.prototype, ["__constructor__"], 1);
}
ASSetPropFlags(Function.prototype, ["extend"], 1);
