!function(){function e(e,t,n){t.is&&t.getCustomData("block_processed")||(t.is&&CKEDITOR.dom.element.setMarker(n,t,"block_processed",!0),e.push(t))}function t(t,n){function l(){this.foreach(function(e){/^(?!vbox|hbox)/.test(e.type)&&(e.setup||(e.setup=function(t){e.setValue(t.getAttribute(e.id)||"",1)}),e.commit||(e.commit=function(t){var n=this.getValue();"dir"==e.id&&t.getComputedStyle("direction")==n||(n?t.setAttribute(e.id,n):t.removeAttribute(e.id))}))})}var i,o=(i=CKEDITOR.tools.extend({},CKEDITOR.dtd.$blockLimit),t.config.div_wrapTable&&(delete i.td,delete i.th),i),a=CKEDITOR.dtd.div,d={},r=[];return{title:t.lang.div.title,minWidth:400,minHeight:165,contents:[{id:"info",label:t.lang.common.generalTab,title:t.lang.common.generalTab,elements:[{type:"hbox",widths:["50%","50%"],children:[{id:"elementStyle",type:"select",style:"width: 100%;",label:t.lang.div.styleSelectLabel,"default":"",items:[[t.lang.common.notSet,""]],onChange:function(){var e=["info:elementStyle","info:class","advanced:dir","advanced:style"],n=this.getDialog(),l=n._element&&n._element.clone()||new CKEDITOR.dom.element("div",t.document);this.commit(l,!0);for(var i,o=(e=[].concat(e)).length,a=0;a<o;a++)(i=n.getContentElement.apply(n,e[a].split(":")))&&i.setup&&i.setup(l,!0)},setup:function(e){for(var n in d)d[n].checkElementRemovable(e,!0,t)&&this.setValue(n,1)},commit:function(e){var n;(n=this.getValue())?d[n].applyToObject(e,t):e.removeAttribute("style")}},{id:"class",type:"text",requiredContent:"div(cke-xyz)",label:t.lang.common.cssClass,"default":""}]}]},{id:"advanced",label:t.lang.common.advancedTab,title:t.lang.common.advancedTab,elements:[{type:"vbox",padding:1,children:[{type:"hbox",widths:["50%","50%"],children:[{type:"text",id:"id",requiredContent:"div[id]",label:t.lang.common.id,"default":""},{type:"text",id:"lang",requiredContent:"div[lang]",label:t.lang.common.langCode,"default":""}]},{type:"hbox",children:[{type:"text",id:"style",requiredContent:"div{cke-xyz}",style:"width: 100%;",label:t.lang.common.cssStyle,"default":"",commit:function(e){e.setAttribute("style",this.getValue())}}]},{type:"hbox",children:[{type:"text",id:"title",requiredContent:"div[title]",style:"width: 100%;",label:t.lang.common.advisoryTitle,"default":""}]},{type:"select",id:"dir",requiredContent:"div[dir]",style:"width: 100%;",label:t.lang.common.langDir,"default":"",items:[[t.lang.common.notSet,""],[t.lang.common.langDirLtr,"ltr"],[t.lang.common.langDirRtl,"rtl"]]}]}]}],onLoad:function(){l.call(this);var e=this,n=this.getContentElement("info","elementStyle");t.getStylesSet(function(l){var i,o;if(l)for(var a=0;a<l.length;a++)(o=l[a]).element&&"div"==o.element&&(i=o.name,d[i]=o=new CKEDITOR.style(o),t.filter.check(o)&&(n.items.push([i,i]),n.add(i,i)));n[1<n.items.length?"enable":"disable"](),setTimeout(function(){e._element&&n.setup(e._element)},0)})},onShow:function(){"editdiv"==n&&this.setupContent(this._element=CKEDITOR.plugins.div.getSurroundDiv(t))},onOk:function(){if("editdiv"==n)r=[this._element];else{var l,i,d,s=[],m={},c=[],g=t.getSelection(),u=g.getRanges(),h=g.createBookmarks();for(i=0;i<u.length;i++)for(d=u[i].createIterator();l=d.getNextParagraph();)if(l.getName()in o&&!l.isReadOnly()){var f=l.getChildren();for(l=0;l<f.count();l++)e(c,f.getItem(l),m)}else{for(;!a[l.getName()]&&!l.equals(u[i].root);)l=l.getParent();e(c,l,m)}for(CKEDITOR.dom.element.clearAllMarkers(m),u=[],i=null,d=0;d<c.length;d++)l=c[d],(f=t.elementPath(l).blockLimit).isReadOnly()&&(f=f.getParent()),t.config.div_wrapTable&&f.is(["td","th"])&&(f=t.elementPath(f.getParent()).blockLimit),f.equals(i)||(i=f,u.push([])),l.getParent()&&u[u.length-1].push(l);for(i=0;i<u.length;i++)if(u[i].length){for(c=(f=u[i][0]).getParent(),l=1;l<u[i].length;l++)c=c.getCommonAncestor(u[i][l]);for(c||(c=t.editable()),d=new CKEDITOR.dom.element("div",t.document),l=0;l<u[i].length;l++){for(f=u[i][l];f.getParent()&&!f.getParent().equals(c);)f=f.getParent();u[i][l]=f}for(l=0;l<u[i].length;l++)(f=u[i][l]).getCustomData&&f.getCustomData("block_processed")||(f.is&&CKEDITOR.dom.element.setMarker(m,f,"block_processed",!0),l||d.insertBefore(f),d.append(f));CKEDITOR.dom.element.clearAllMarkers(m),s.push(d)}g.selectBookmarks(h),r=s}for(s=r.length,m=0;m<s;m++)this.commitContent(r[m]),!r[m].getAttribute("style")&&r[m].removeAttribute("style");this.hide()},onHide:function(){"editdiv"==n&&this._element.removeCustomData("elementStyle"),delete this._element}}}CKEDITOR.dialog.add("creatediv",function(e){return t(e,"creatediv")}),CKEDITOR.dialog.add("editdiv",function(e){return t(e,"editdiv")})}();