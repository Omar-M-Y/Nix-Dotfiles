{ colorsPath }:

''
/* 1. Import the clean Pywal variables */
@import "${colorsPath}"

/* 2. Define Layout */

window {
    background-color: @background;
    border: 1px solid;
    border-color: @border-color;
    border-radius: 12px;
    padding: 10px;
    width: 30%;
    location: center;
}

mainbox {
    background-color: transparent;
    children: [ inputbar, listview ];
}

inputbar {
    children: [ prompt, entry ];
    background-color: transparent;
    text-color: @normal-foreground;
    border: 0px 0px 2px 0px solid;
    border-color: @border-color; 
    border-radius: 0px;
    padding: 8px;
    margin: 0px 0px 10px 0px;
}

prompt {
    background-color: transparent;
    text-color: @normal-foreground;
    padding: 5px;
    margin: 0px 5px 0px 0px;
}

entry {
    background-color: transparent;
    text-color: @normal-foreground;
    placeholder-color: @normal-foreground;
    expand: true;
    padding: 5px;
}

listview {
    background-color: transparent;
    columns: 1;
    lines: 10;
    spacing: 5px;
    scrollbar: false;
    fixed-height: false;
}

element {
    background-color: transparent;
    text-color: @normal-foreground;
    padding: 8px;
    border-radius: 8px;
    orientation: horizontal;
}

element-icon {
    size: 1.2em;
    margin: 0px 10px 0px 0px;
    background-color: transparent;
}

element-text {
    background-color: transparent;
    text-color: inherit;
    expand: true;
    vertical-align: 0.5;
}

/* 3. Apply Colors to States */

element normal.normal {
    background-color: @normal-background;
    text-color: @normal-foreground;
}

element selected.normal {
    background-color: @selected-normal-background;
    text-color: @selected-normal-foreground;
    border-radius: 8px;
}

element alternate.normal {
    background-color: @alternate-normal-background;
    text-color: @alternate-normal-foreground;
}
''
