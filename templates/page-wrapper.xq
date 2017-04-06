declare variable  $body external;
declare variable  $title external;
declare variable  $base external;

let $css:= 'resources/base.css'
return
    <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <meta http-equiv="Generator"
                    content="https://github.com/expkg-zone58" />

                <title>           
                   {$title}
                </title>

                 <link rel="stylesheet" type="text/css" href="{$base}resources/page.css" />
                <link rel="stylesheet" type="text/css" href="{$base}resources/query.css" />
                <link rel="stylesheet" type="text/css" href="{$base}{$css}" />
    
            </head>
            <body class="home" id="top">
                <div id="main">
                    {$body}
                    </div>
            </body>
        </html>