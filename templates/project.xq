(:~ 
 : html project doc
 :       <description>Parse expressions in XPath or XQuery into XML trees using
 :           REx generated parsers
 :       </description>
 :       <namespace uri="http://expath.org/ns/xparse" />
 :       <repo url=""/> <!-- https://github.com/expkg-zone58/{$name} -->
 :       <local path="C:\Users\andy\workspace\ex-xparse\" />
 :       <doc src="dist\doc\xparse.xqm.xml" />
:)
declare namespace pkg="http://expath.org/ns/pkg";
declare  variable  $project external ;

let $name:=$project/@name/string()
let $cxan:=doc($project/local/@path || "src/main/expath-pkg.xml")/pkg:package
return 
<section id="{$name}">
    <h3>
    <a href="#{$name}">               
    {$name}
     </a>
     <span class="namespace" title="Namespace">{$cxan/pkg:xquery/pkg:namespace/text()}</span>
    </h3>
    <dl>
    <dt class="label">Summary</dt>
    <dd>{$cxan/pkg:title/(*|text())}</dd>

    <dt class="label">Documentation</dt>
    <dd><a href="projects/{$name}.html">xqDoc</a></dd> 
    
    <dt class="label">Repository</dt>
    <dd><a href="https://github.com/expkg-zone58/{$name}">https://github.com/expkg-zone58/{$name}</a></dd> 
  
    </dl>
   </section>