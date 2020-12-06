# AwImageGrid

See:
https://stackoverflow.com/a/8954813/757830

For the fun of it, I wrote an ImageGrid component for Jerry Dodge, user of and asker on Stack Overflow.

It has only a vertical scroll bar; resizing the width of the control adjusts the column count and row count. The images are cached as resized bitmaps in an internal list, along with their file names.

Because loading and resampling these images may take some time, depending on image count, resolution and whether you want to use the Graphics32 library for better resample quality, the component delegates the loading process to a separate thread, which (re)runs on setting the column width or the row height, and on changing the file names or the folder path in which the component tries to find all images of types to be supplied in the FileFormats property.

# Features:

Creates and resizes image thumbs in a background thread, from file names with the GDI+ library or from manually added images with the Graphics 32 library

Automatically recognizes all registered image file formats

Animated scrolling

Touchscreen support for scrolling by dragging the grid

Keyboard support for selecting thumbs

OwnerDraw support, e.g. for adding captions to the thumbs

Virtual support for bypassing the automatic creation of thumbs

# Properties and events:

ColCount: number of columns, readonly

Count: number of images, readonly

Images: list of all manually added images where the thumbs are internally created from

Items: list of all filename-thumbnail or image-thumbnail combinations

RowCount: number of rows, readonly

Thumbs: list of all internally created thumbs

AutoHideScrollBar: hides the scroll bar when all rows are visible

BorderStyle: shows or hides themed border

BorderWidth: margin of the component, outside of the scroll bar

CellAlignment: alignes thumbs at the left, center or right of the cell

CellHeight: height of cell

CellLayout: alignes thumbs at the top, middle or bottom of the cell

CellSpacing: spacing between the cells

CellWidth: width of cell

Color: background color of border and cell spacing

ColWidth: width of column (equals width of cell plus cell spacing)

DefaultDrawing: draws all thumbs by default

DesignPreview: shows thumbs in the designer

DragScroll: supports scrolling the grid by draging the grid

FileFormats: image file name extensions by which the file names are filtered

FileNames: list holding all file names

Folder: the directory in which the component tries to find all images files

ItemIndex: selected cell index

MarkerColor: color of temporarily thumb marker during loading process

MarkerStyle: style of temporarily thumb marker during loading process

OnClickCell: fires when a cell is clicked

OnDrawCell: fires when a cell is drawn

OnMeasureThumb: fires when the size of a thumb is to be calculated

OnProgress: fires when an image is resized to thumb format

OnUnresolved: fires when a thumb cannot be created, e.g. when file name is not found

RetainUnresolvedItems: keeps empty thumbs in the list

RowHeight: the row height (equals cell height plus cell spacing)

ParentBackground: draws the (themed) background of the parent in the border and between the cells

Proportional: resizes images proportionally

Sorted: file names are sorted

Stretch: stretches small images up to the cell size

VirtualMode: prevents of automatically creating the thumbs

WheelScrollLines: number of rows to be scrolled with mouse wheel
