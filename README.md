# iOS-uyghur-keyboard-webview
ئ‍ايفۇندىكى webview غا  ئۇيغۇرچە كىرگۈزۈش ئۇسۇلى


----------


## كەسمە رەسىملەر
![enter image description here](http://115.29.113.224/issue/forgit.gif)


----------


## ئىشىلتىش ئۇسۇلى 
html دىكى input  قا تۆۋەندىكىنى قاتىمىز

```javascript
<input id="name" type="text" placeholder="ئىسمى" name="firstname" onclick="onInputClick(this,'ئىسمى')" />
<script>
function onInputClick(inputitem,inputhint){
window.location.href= ('almas:'+inputitem.id+':'+inputitem.value+':'+inputhint)
}
function settext(inputitemid,value){
document.getElementById(inputitemid).value=value
}
</script>

----------
## e-mail:822161777@qq.com