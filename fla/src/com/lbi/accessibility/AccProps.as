/**
	LBi Useful ActionScript 2 Library
    Copyright (C) 2007 LBi / Michael Forrest

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA 
 * Accessibility Properties available for use in MovieClips, TextFields etc..
 */
class com.lbi.accessibility.AccProps {
	/**
	 * IDE Equivalent: Make Movie Accessible/ Make Object Accessible (inverse logic)
	 * Applies to: Whole SWF files, Movie clips, Buttons, Dynamic text, Input text
	 */
	public var silent:Boolean;
	/** 
	 * IDE Equivalent: Make Child Objects Accessible (inverse logic)
 	 * Applies to: Whole SWF files Movie clips
 	 */  
	public var forceSimple:Boolean;
 	
	/** 
	 * IDE Equivalent: Name 
	 * Applies to: Whole SWF files, Movie clips, Buttons, Input text
	 */ 
 	public var name:String; 
 	
	/** 
	 * IDE Equivalent: Description 
	 * Applies to: Whole SWF files, Movie clips, Buttons, Dynamic text, Input text 
	 */
	public var description:String;
 	/**
 	 * IDE Equivalent: Shortcut
 	 * Applies to: Movie clips, Buttons, Input text
 	 * E.g. "Control+A", 
 	 */
 	public var shortcut: String;
	
}