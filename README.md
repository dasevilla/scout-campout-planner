# Scout Campout Planner

This repository contains a set of PDF worksheets designed to help scouts plan a campout. The worksheets are built using LaTeX and are organized into individual worksheets that cover various aspects of campout planning. A combined PDF that includes all of the worksheets in one document.

Check the [releases page](https://github.com/dasevilla/scout-campout-planner/releases) for pre-built PDFs.

## Worksheets

### Combined Planner

File: `scout-campout-planner.pdf`

This combined PDF includes all of the worksheets needed for scouts to plan a campout. It provides a comprehensive tool for documenting activities, equipment, menus, shopping lists, an overview, and the campout roster.

### Individual Worksheets

#### Campout Overview

File: `planner-overview.pdf`

A high-level overview of the campout, including sections for the What, Where, Who, and Potential Hazards.

#### Menu Planner

File: `planner-menu-planner.pdf`

A worksheet for planning the menu for the campout. Includes sections for each meal, allowing scouts to list the main course, sides, and drinks.

#### Shopping List

File: `planner-menu-shopping-list.pdf`

A worksheet for creating a shopping list for the campout. Scouts can list the items needed for the menu, along with the quantity of each item.

#### Activities Planner

File: `planner-activities.pdf`

A worksheet for documenting the activities planned for the campout. Scouts can specify when each activity occurs, any reservation requirements, and details about the activity.

#### Equipment Planner

File: `planner-equipment.pdf`

A worksheet for listing any special equipment needed for the campout. Includes a table for scouts to document the equipment required and the quantity needed.

#### Roster

File: `planner-roster.pdf`

A worksheet for documenting who will be attending the campout. Scouts can list each attendee's role and name.


## Development

### Install

The worksheets don't require special packages, so any standard TeX distribution should work.

### Build

This project uses a `Makefile` to automate the build process.

- **Build All PDFs:** Run `make all` to generate all individual PDF worksheets as well as the combined scout campout planner PDF.
- **Clean Generated Files:** Run `make clean` to remove all generated files, returning the directory to its original state.
