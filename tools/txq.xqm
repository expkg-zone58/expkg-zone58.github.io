xquery version "3.1";
(:~
: A(nother) templating Engine for XQuery (BaseX specific)
: specials:
: partial(file,name,sequence)
:
: @author andy bunce
: @since sept 2012
: @licence apache 2
:)
 
module namespace txq = 'quodatum.txq';
declare default function namespace 'quodatum.txq';
import module namespace xquery = "http://basex.org/modules/xquery";
 
(:~
: template function
: @param template url to fill
: @param map name and value to apply
: @return updated doc from map
:)
declare function render($template as xs:string,$map as map(*))
{
    let $map:=map:merge(($map,map{"partial": partial(?,?,?,$map,$template)}))
    return xquery:invoke($template,$map)
};
 
(:~
: template function with wrapping layout
: @param $layout outer template with $body placeholder to insert $template
: @return updated doc from map
:)
declare function render($template as xs:string,$map as map(*),$layout as xs:string)
{
    let $content:=render($template,$map)
    let $map:=map:merge((map{"body": $content},$map))
    return render($layout,$map)
};
 
(:~
: partial template function: evaluate part for each value in sequence
: @return updated doc from map
:)
declare function partial($part as xs:string,$name,$seq,$map as map(*),$base)
{
    for $s in $seq
    let $map:=map:merge((map{$name: $s},$map))
    return render(fn:resolve-uri($part,$base),$map)
};