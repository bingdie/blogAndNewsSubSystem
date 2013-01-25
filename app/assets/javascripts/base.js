/**
 * Created with JetBrains RubyMine.
 * User: gateway
 * Date: 13-1-23
 * Time: 下午4:37
 * To change this template use File | Settings | File Templates.
 */
var rttophtml5mobi = {
    author: "zjnxyz",
    version: "1.0",
    website: "http://127.0.0.1:3000"
}

var rttophtml5mobiutils={
    setParam: function(name,value){
        localStorage.setItem(name,value)
    },
    getParam: function(name){
        return localStorage.getItem(name)
    }
}

var url={
    cateurl: rttophtml5mobi.website+"/welcome/cate" ,
    newsurl:  rttophtml5mobi.website+"/news_data/"
}

$("#index_index").live("pagecreate",function(){
    var $li="";
    var $strSubStr = "";
    var intSubNum = 0;
    var $webSite = rttophtml5mobi.website;
    var $webUrl = $webSite+"/news_cates";
    var $listview = $(this).find('ul[data-role="listview"]');

    var $tp1_Index_List = function($p_array,$p_items){

        if(rttophtml5mobiutils.getParam('user_sub_str') != null){

         $strSubStr = rttophtml5mobiutils.getParam('user_sub_str');
            var $arrSubStr = new Array();
            $arrSubStr = $strSubStr.split(",");
            intSubNum = $arrSubStr.length-1;
            for(var i=0;i<$p_items.length;i++){
                if($strSubStr.indexOf($p_items[i].id) != -1){
                    $li = '<li class="lst" data-icon="false">' +
                        '<a href="'+url.cateurl+'" data-ajax="false"' +
                        'data-catename="'+$p_items[i].news_catename+'"' +
                        'data-id="'+$p_items[i].id+'" ' +
                        'style="margin:0px;padding:0px 0px 0px 55px" >' ;
                        if($p_items[i].news_iconurl == ""){
                          $li += '<img src="/assets/tool_8.jpg" alert="" />' +
                                 '<h3>'+$p_items[i].news_catename+'</h3>' +
                                 '</a></li>';
                        }else{
                            $li += '<img src="/assets/'+$p_items[i].news_iconurl+'" alert="" />' +
                                   '<h3>'+$p_items[i].news_catename+'</h3>' +
                                   '</a></li>';
                        }

                    $p_array.push($li);
                }

            }
        }   else{
              $li = '<li style="text-align:center;">您还没有订阅任何消息</li>'
            $p_array.push($li);
        }
    }

    var $lst_Index_List = function(){
        $.ajax({
            type: "get",
            url: $webUrl,
            dataType:"json",
            data:{},
            success: function(data, textStatus){
                var li_array = [];
                $tp1_Index_List(li_array,data);
                var strTitle = '<li data-role="list-divider">' +
                    '我的订阅<span class="ui-li-count">' +
                    intSubNum+'</span></li>';
                $listview.html(strTitle+li_array.join(""));
                $listview.listview('refresh');
                $listview.delegate('li a','click',function(e){
                    rttophtml5mobiutils.setParam("cate_link_id",$(this).data('id'))
                    rttophtml5mobiutils.setParam("cate_link_name",$(this).data('catename'))
                })
            },
            complete: function(XMLHttpRequest, textStatus){
                //HideLoading();
            },
            error: function(){
                //请求出错处理
            }
        });


    }
    $lst_Index_List();
})

//订阅新闻
$("#newsub_index").live("pagecreate",function(){

    var $li="";
    var $strSubStr = "";
    var intSubNum = 0;
    var $webSite = rttophtml5mobi.website;
    var $webUrl = $webSite+"/news_cates";
    var $listview = $(this).find('ul[data-role="listview"]');
    var $tp1_Sub_List = function($p_array,$p_items){
        if($p_items.length>0){
            if(rttophtml5mobiutils.getParam('user_sub_str') != null){
                $strSubStr = rttophtml5mobiutils.getParam('user_sub_str');
                for(var i=0;i<$p_items.length;i++){
                    if($strSubStr.indexOf($p_items[i].id) == -1){
                        $li = '<li class="lst" data-icon="false">' +
                            '<a href="'+url.cateurl+'" data-ajax="false"' +
                            'data-catename="'+$p_items[i].news_catename+'"' +
                            'data-id="'+$p_items[i].id+'" ' +
                            'style="margin:0px;padding:0px 0px 0px 55px" >' ;
                        if($p_items[i].news_iconurl == ""){
                           $li += '<img src="/assets/tool_8.jpg" alert="" />' +
                                  '<h3>'+$p_items[i].news_catename+'</h3><p>' +
                                  $p_items[i].new_catedesc+'</p></a>' +
                                  '<a data-id="'+$p_items[i].id+'" class="a1" href="javascript:"' +
                                  '</a></li>';
                        } else{
                            $li += '<img src="/assets/'+$p_items[i].news_iconurl+'" alert="" />' +
                                   '<h3>'+$p_items[i].news_catename+'</h3><p>' +
                                   $p_items[i].new_catedesc+'</p></a>' +
                                   '<a data-id="'+$p_items[i].id+'" class="a1" href="javascript:"' +
                                   '</a></li>';
                        }

                        $p_array.push($li);
                    }
                }
            }else{
                for(var i=0;i<$p_items.length;i++){
                    $li = '<li class="lst" data-icon="false">' +
                        '<a href="'+url.cateurl+'" data-ajax="false"' +
                        'data-catename="'+$p_items[i].news_catename+'"' +
                        'data-id="'+$p_items[i].id+'" ' +
                        'style="margin:0px;padding:0px 0px 0px 55px"';
                    if($p_items[i].news_iconurl == ""){
                        $li += '<img src="/assets/tool_8.jpg" alert="" />' +
                            '<h3>'+$p_items[i].news_catename+'</h3><p>' +
                            $p_items[i].new_catedesc+'</p></a>' +
                            '<a data-id="'+$p_items[i].id+'" class="a1" href="javascript:"' +
                            '</a></li>';
                    } else{
                        $li += '<img src="/assets/'+$p_items[i].news_iconurl+'" alert="" />' +
                            '<h3>'+$p_items[i].news_catename+'</h3><p>' +
                            $p_items[i].new_catedesc+'</p></a>' +
                            '<a data-id="'+$p_items[i].id+'" class="a1" href="javascript:"' +
                            '</a></li>';
                    }
                    $p_array.push($li);
                }
            }
        }else{
            $li = '<li class="lst">没有可以订阅的栏目</li>'
        }

    }


    var $lst_Sub_List = function(){
        $.ajax({
            type: "get",
            url: $webUrl,
            dataType:"json",
            data:{},
            success: function(data, textStatus){

                var li_array = [];
                $tp1_Sub_List(li_array,data);
                var strTitle = '<li data-role="list-divider"精品推荐</li>';
                $listview.html(strTitle+li_array.join(""));
                $listview.listview('refresh');
                $listview.delegate('li a','click',function(e){
                    rttophtml5mobiutils.setParam("cate_link_id",$(this).data('id'));
                    rttophtml5mobiutils.setParam("cate_link_name",$(this).data('catename'));
                });

                $listview.delegate('li .a1','click',function(e){
                    $strSubStr +=$(this).data('id') + ',' ;
                    rttophtml5mobiutils.setParam("user_sub_str",$strSubStr) ;
                    window.location.reload();
                }) ;
            },
            complete: function(XMLHttpRequest, textStatus){
                //HideLoading();
            },
            error: function(){
                //请求出错处理
            }
        });
    }
    $lst_Sub_List();
})

$("#newscate_index").live("pagecreate",function(){
    var $li="";
    var $strId ="";
    var $strName = "";
    var $webUrl1 = "";
    var $webUrl2 ="";
    var $webSite = rttophtml5mobi.website;
    var $listview = $(this).find('ul[data-role="listview"]');
    var $catename = $(this).find('[data-role="header"] h4');
    var $adlist = $("#news_list");
    var $adinfo = $("#news_info");
    var $adbg = $("#news_bg")
    var $tp1_Cate_Ad = function($p_array,$p_items){
                    $li ='<a href="#" data-ajax="false"' +
                        'data-catename="'+$p_items.news_catename+'"' +
                        'data-id="'+$p_items.id+'" >';
                    if($p_items.news_iconurl==""){
                      $li += '<img src="/assets/tool_8.jpg" alert="" /></a>';
                    }else{
                       $li += '<img src="/assets/'+$p_items.news_iconurl+'" alert="" /> </a>';
                    }

                    $adinfo.html($p_items.new_catedesc);
                    $catename.html($p_items.news_catename);
                    $p_array.push($li);
    }

    var $tp1_Cate_List = function($p_array,$p_items){
        if($p_items.length>0){
            for(var i=0;i<$p_items.length;i++){

                $li ='<li class="lst" data-icon="false">'+
                    '<a href="'+url.newsurl+$p_items[i].id+'" data-ajax="false"' +
                    'data-catename="'+$p_items[i].news_cate_id+'"' +
                    'data-id="'+$p_items[i].id+'" ' +
                    'style="margin:0px;padding:0px" >' +
                    '<h3>'+$p_items[i].news_title+'</h3>'+
                    '</a></li>';
                $p_array.push($li);
            }
        }else{
            $li = '<li class="lst" data-icon="alert">该栏目下没有新闻</li>'
            $p_array.push($li);
        }


    }

    var $lst_Cate_Ad = function(){
        $strId = rttophtml5mobiutils.getParam("cate_link_id");
        $strName =rttophtml5mobiutils.getParam("cate_link_name");
        $webUrl1 = $webSite+"/news_cates/"+$strId;
        $.ajax({
            type: "get",
            url: $webUrl1,
            dataType:"json",
            data:{},
            success: function(data, textStatus){
                var li_array=[];
                $tp1_Cate_Ad(li_array,data);
                $adbg.html(li_array.join('')) ;
                $adbg.delegate('li a','click',function(e){
                    rttophtml5mobiutils.setParam("pk_link_id",$(this).data('id'));
                    rttophtml5mobiutils.setParam("pk_link_name",$(this).data('catename'));
                })
            },
            complete: function(XMLHttpRequest, textStatus){
                //HideLoading();
            },
            error: function(){
                //请求出错处理
            }
        });
    }

    var $lst_Cate_List = function(){
        $strId = rttophtml5mobiutils.getParam("cate_link_id");
        $webUrl2 = $webSite+"/news_data/find/"+$strId;

        $.ajax({
            type: "get",
            url: $webUrl2,
            dataType:"json",
            data:{},
            success: function(data, textStatus){
                var li_array=[];
                $tp1_Cate_List(li_array,data);
                $listview.html(li_array.join(""));
                $listview.listview('refresh');
                $listview.delegate('li a','click',function(e){
                    rttophtml5mobiutils.setParam("p_link_id",$(this).data('id'));
                    rttophtml5mobiutils.setParam("cate_link_name",$(this).data('catename'));
                })
            },
            complete: function(XMLHttpRequest, textStatus){
                //HideLoading();
            },
            error: function(){
                //请求出错处理
            }
        });
    }
    $lst_Cate_Ad();
    $lst_Cate_List();
})


