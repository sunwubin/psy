function getRootPath(){
    //��ȡ��ǰ��ַ���磺 http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //��ȡ������ַ֮���Ŀ¼���磺 uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //��ȡ������ַ���磺 http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //��ȡ��"/"����Ŀ�����磺/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
}