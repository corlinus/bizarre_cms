// ----------------------------------------------------------------------------
// markItUp!
// ----------------------------------------------------------------------------
// Copyright (C) 2011 Jay Salvat
// http://markitup.jaysalvat.com/
// ----------------------------------------------------------------------------
// Html tags
// http://en.wikipedia.org/wiki/html
// ----------------------------------------------------------------------------
// Basic set. Feel free to add more tags
// ----------------------------------------------------------------------------
var mySettings = {
 nameSpace:          'markdown', // Useful to prevent multi-instances CSS conflict
    previewParserPath:  '/admin/parse',
    onShiftEnter:       {keepDefault:false, openWith:'\n\n'},
    markupSet: [
        {name:'First Level Heading', key:"1", placeHolder:'Your title here...',
          closeWith:function(markItUp) { return miu.markdownTitle(markItUp, '=') } },
        {name:'Second Level Heading', key:"2", placeHolder:'Your title here...',
          closeWith:function(markItUp) { return miu.markdownTitle(markItUp, '-') } },
        {name:'Heading 3', key:"3", openWith:'### ', placeHolder:'Your title here...' },
        {name:'Heading 4', key:"4", openWith:'#### ', placeHolder:'Your title here...' },
        {name:'Heading 5', key:"5", openWith:'##### ', placeHolder:'Your title here...' },
        {name:'Heading 6', key:"6", openWith:'###### ', placeHolder:'Your title here...' },
        {separator:'---------------' },        
        {name:'Bold', key:"B", openWith:'**', closeWith:'**'},
        {name:'Italic', key:"I", openWith:'_', closeWith:'_'},
        {separator:'---------------' },
        {name:'Bulleted List', openWith:'- ' },
        {name:'Numeric List', openWith:function(markItUp) {
            return markItUp.line+'. ';
        }},
        {separator:'---------------' },
        {name:'Picture', key:"P",
          replaceWith:function(markItUp) { return miu.markdownImage(markItUp) } },
        {name:'Link', key:"L", openWith:'[', closeWith:']([![Url:!:http://]!] "[![Title]!]")', placeHolder:'Your text to link here...' },
        {separator:'---------------'},    
        {name:'Quotes', openWith:'> '},
        {name:'Code Block / Code', openWith:'(!(\t|!|`)!)', closeWith:'(!(`)!)'},
        {separator:'---------------'},
        {name:'Preview', call:'preview', className:"preview"}
    ]
}

// mIu nameSpace to avoid conflict.
miu = {
    markdownTitle: function(markItUp, char) {
        heading = '';
        n = $.trim(markItUp.selection||markItUp.placeHolder).length;
        for(i = 0; i < n; i++) {
            heading += char;
        }
        return '\n'+heading+'\n';
    },
    markdownImage: function(markItUp) {
       assetPicker.showFinder('#'+$(markItUp.textarea).attr('id'), {
            "height": 400,
            "stylesSet": [],
            "extraPlugins": "stylesheetparser,richfile,MediaEmbed,audio",
            "removePlugins": "scayt,menubutton,contextmenu,image,forms",
            "contentsCss": "/assets/rich/editor.css",
            "removeDialogTabs": "link:advanced;link:target",
            "startupOutlineBlocks": true,
            "forcePasteAsPlainText": true,
            "format_tags": "h3;p;pre",
            "toolbar": [["Format", "Styles"], ["Bold", "Italic", "-", "NumberedList", "BulletedList", "Blockquote", "-", "richImage", "-", "Link", "Unlink"], ["Source", "ShowBlocks"]],
            "language": "ru",
            "richBrowserUrl": "/rich/files/",
            "uiColor": "#f4f4f4",
            "allowed_styles": ["thumb", "rich_thumb", "original"],
            "default_style": "thumb",
            "insert_many": false,
            "allow_document_uploads": false,
            "allow_embeds": false,
            "style": "width: 400px !important;!"
        });
      return "%%image%%";
    }
}
