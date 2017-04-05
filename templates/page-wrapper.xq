declare variable  $body external;
declare variable  $title external;
declare variable  $base external;

let $css:=$base || 'resources/base.css'
return
    <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <meta http-equiv="Generator"
                    content="xquerydoc - https://github.com/xquery/xquerydoc" />

                <title>           
                   {$title}
                </title>
                <style type="text/css">
                    {fn:unparsed-text( '../resources/page.css','UTF-8')}
                </style>

                <style type="text/css">
                    {fn:unparsed-text( '../resources/query.css','UTF-8')}
                </style>

                <link rel="stylesheet" type="text/css" href="{$css}" />
    
            </head>
            <body class="home" id="top">
                <div id="main">
                    {$body}
                    </div>
            </body>
        </html>