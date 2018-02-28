<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:50:"themes/admin_simpleboot3/admin\order\addorder.html";i:1519559042;s:103:"D:\UPUPW_AP7.0_64\vhosts\www.bangbangyz.com\thinkcmf\public\themes\admin_simpleboot3\public\header.html";i:1519298689;}*/ ?>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->


    <link href="/themes/admin_simpleboot3/public/assets/themes/<?php echo cmf_get_admin_style(); ?>/bootstrap.min.css" rel="stylesheet">
    <link href="/themes/admin_simpleboot3/public/assets/simpleboot3/css/simplebootadmin.css" rel="stylesheet">
    <link href="/static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        form .input-order {
            margin-bottom: 0px;
            padding: 0 2px;
            width: 42px;
            font-size: 12px;
        }

        form .input-order:focus {
            outline: none;
        }

        .table-actions {
            margin-top: 5px;
            margin-bottom: 5px;
            padding: 0px;
        }

        .table-list {
            margin-bottom: 0px;
        }

        .form-required {
            color: red;
        }
    </style>
    <script type="text/javascript">
        //全局变量
        var GV = {
            ROOT: "/",
            WEB_ROOT: "/",
            JS_ROOT: "static/js/",
            APP: '<?php echo \think\Request::instance()->module(); ?>'/*当前应用名*/
        };
    </script>
    <script src="/themes/admin_simpleboot3/public/assets/js/jquery-1.10.2.min.js"></script>
    <script src="/static/js/wind.js"></script>
    <script src="/themes/admin_simpleboot3/public/assets/js/bootstrap.min.js"></script>
    <script>
        Wind.css('artDialog');
        Wind.css('layer');
        $(function () {
            $("[data-toggle='tooltip']").tooltip();
            $("li.dropdown").hover(function () {
                $(this).addClass("open");
            }, function () {
                $(this).removeClass("open");
            });
        });
    </script>
    <?php if(APP_DEBUG): ?>
        <style>
            #think_page_trace_open {
                z-index: 9999;
            }
        </style>
    <?php endif; ?>
<style type="text/css">
    .pic-list li {
        margin-bottom: 5px;
    }
</style>
<script type="text/html" id="photos-item-tpl">
    <li id="saved-image{id}">
        <input id="photo-{id}" type="hidden" name="photo_urls[]" value="{filepath}">
        <input class="form-control" id="photo-{id}-name" type="text" name="orderImage[]" value="{name}"
               style="width: 200px;" title="图片名称">
        <img id="photo-{id}-preview" src="{url}" style="height:36px;width: 36px;"
             onclick="imagePreviewDialog(this.src);">
        <a href="javascript:uploadOneImage('图片上传','#photo-{id}');">替换</a>
        <a href="javascript:(function(){$('#saved-image{id}').remove();})();">移除</a>
    </li>
</script>
<script type="text/html" id="files-item-tpl">
    <li id="saved-file{id}">
        <input id="file-{id}" type="hidden" name="file_urls[]" value="{filepath}">
        <input class="form-control" id="file-{id}-name" type="text" name="file_names[]" value="{name}"
               style="width: 200px;" title="文件名称">
        <a id="file-{id}-preview" href="{preview_url}" target="_blank">下载</a>
        <a href="javascript:uploadOne('图片上传','#file-{id}','file');">替换</a>
        <a href="javascript:(function(){$('#saved-file{id}').remove();})();">移除</a>
    </li>
</script>
</head>
<body>
<div class="wrap js-check-wrap">
    <ul class="nav nav-tabs">
        <li><a href="<?php echo url('Order/index'); ?>">工单管理</a></li>
        <li class="active"><a href="<?php echo url('Order/addOrder'); ?>">添加工单</a></li>
    </ul>
    <form action="<?php echo url('Order/addPost'); ?>" method="post" class="form-horizontal js-ajax-form margin-top-20">
        <div class="row">
            <div class="col-md-9">
                <table class="table table-bordered">
                    <tr>
                        <th width="100">装修风格<span class="form-required">*</span></th>
                        <td>
                            <select class="form-control"  name="post[orderType]">
                                <option>请选择</option>
                                <option value="1">小王</option>
                                <option>小白</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>设计师<span class="form-required">*</span></th>
                        <td>
                            <select class="form-control"  name="post[orderDesigner]">
                                <option>请选择</option>
                                <option value="1">小王</option>
                                <option>小白</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>监理<span class="form-required">*</span></th>
                        <td>
                            <select class="form-control"  name="post[orderSupervisor]">
                                <option>请选择</option>
                                <option value="1">小王</option>
                                <option>小白</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>业主姓名<span class="form-required">*</span></th>
                        <td>
                            <input class="form-control" type="text" name="post[orderName]"
                                   id="orderName" required value="" placeholder="请输入业主姓名"/>
                        </td>
                    </tr>
                    <tr>
                        <th>业主电话<span class="form-required">*</span></th>
                        <td>
                            <input class="form-control" type="text" name="post[userTel]"
                                   id="userTel" required value="" placeholder="请输入业主电话"/>
                        </td>
                    </tr>
                    <tr>
                        <th>装修所在地<span class="form-required">*</span></th>
                        <td>
                            <input class="form-control" type="text" name="post[userAddress]"
                                   id="userAddress" required value="" placeholder="请输入装修所在地"/>
                        </td>
                    </tr>
                    <tr>
                        <th>工单总报价<span class="form-required">*</span></th>
                        <td>
                            <input class="form-control" type="text" name="post[orderTotal]"
                                   id="orderTotal" required value="" placeholder="请输入工单总价格"/>
                        </td>
                    </tr>
                    <tr>
                        <th>工单总周期<span class="form-required">*</span></th>
                        <td>
                            <input class="form-control" type="text" name="post[orderCycle]"
                                   id="orderCycle" required value="" placeholder="请输入工单总周期"/>
                        </td>
                    </tr>
                    <tr>
                        <th>装修风格简介</th>
                        <td>
                            <script type="text/plain" id="content" name="post[orderContent]"></script>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            装修分期付款<br/>
                            <span onclick="add(this)">添加</span>
                            <span onclick="del(this)">删除</span>

                        </th>
                        <td>
                            <input type="hidden" value="yes">
                            <div id="addContent">
                                <div style="padding: 5px 5px 5px 5px; ">
                                    第<span class="Cycle">1</span>期
                                    <input type="text" name="post[money][1]" class="form-control" style="width: 20%; display: inline;">
                                </div>
                            </div>
                            <input type="hidden" value="no">
                        </td>
                    </tr>

                    <tr>
                        <th>效果图相册</th>
                        <td>
                            <ul id="photos" class="pic-list list-unstyled form-inline"></ul>
                            <a href="javascript:uploadMultiImage('图片上传','#photos','photos-item-tpl');"
                               class="btn btn-default btn-sm">选择图片</a>
                        </td>
                    </tr>
                    <!--<tr>-->
                        <!--<th>附件</th>-->
                        <!--<td>-->
                            <!--<ul id="files" class="pic-list list-unstyled form-inline">-->
                            <!--</ul>-->
                            <!--<a href="javascript:uploadMultiFile('附件上传','#files','files-item-tpl','file');"-->
                               <!--class="btn btn-sm btn-default">选择文件</a>-->
                        <!--</td>-->
                    <!--</tr>-->
                </table>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary js-ajax-submit"><?php echo lang('ADD'); ?></button>
                        <a class="btn btn-default" href="<?php echo url('AdminArticle/index'); ?>"><?php echo lang('BACK'); ?></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <table class="table table-bordered">
                    <tr>
                        <th><b>封面效果图</b></th>
                    </tr>
                    <tr>
                        <td>
                            <div style="text-align: center;">
                                <input type="hidden" name="post[coverImage]" id="thumbnail" value="">
                                <a href="javascript:uploadOneImage('图片上传','#thumbnail');">
                                    <img src="/themes/admin_simpleboot3/public/assets/images/default-thumbnail.png"
                                         id="thumbnail-preview"
                                         width="135" style="cursor: pointer"/>
                                </a>
                                <input type="button" class="btn btn-sm btn-cancel-thumbnail" value="取消图片">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th><b>工期开始时间</b></th>
                    </tr>
                    <tr>
                        <td>
                            <input class="form-control js-bootstrap-datetime" type="text" name="post[orderStartTime]"
                                   value="<?php echo date('Y-m-d H:i:s',time()); ?>">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="/static/js/admin.js"></script>
<script type="text/javascript">
    //编辑器路径定义
    var editorURL = GV.WEB_ROOT;
</script>
<script type="text/javascript" src="/static/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/static/js/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript">
    $(function () {

        editorcontent = new baidu.editor.ui.Editor();
        editorcontent.render('content');
        try {
            editorcontent.sync();
        } catch (err) {
        }

        $('.btn-cancel-thumbnail').click(function () {
            $('#thumbnail-preview').attr('src', '/themes/admin_simpleboot3/public/assets/images/default-thumbnail.png');
            $('#thumbnail').val('');
        });

    });

    function doSelectCategory() {
        var selectedCategoriesId = $('#js-categories-id-input').val();
        openIframeLayer("<?php echo url('AdminCategory/select'); ?>?ids=" + selectedCategoriesId, '请选择分类', {
            area: ['700px', '400px'],
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                //do something

                var iframeWin          = window[layero.find('iframe')[0]['name']];
                var selectedCategories = iframeWin.confirm();
                if (selectedCategories.selectedCategoriesId.length == 0) {
                    layer.msg('请选择分类');
                    return;
                }
                $('#js-categories-id-input').val(selectedCategories.selectedCategoriesId.join(','));
                $('#js-categories-name-input').val(selectedCategories.selectedCategoriesName.join(' '));
                //console.log(layer.getFrameIndex(index));
                layer.close(index); //如果设定了yes回调，需进行手工关闭
            }
        });
    }

    function add(obj) {
        var i = 1;
        var num =  parseInt($('#addContent').children('div').length)+i;
        var html = $('#addContent').html();
        var content = '<div style="padding: 5px 5px 5px 5px; ">'+
        '第<span class="Cycle">'+(num)+'</span>期&nbsp'+
        '<input type="text" name="post[money]['+num+']" class="form-control" style="width: 20%; display: inline;">'+
        '</div>';
        $("#addContent").html(html+content);
    }
    function del(obj) {
        var num =  parseInt($('#addContent').children('div').length);
        var htmlPrev =  $(obj).parents().prev().val();
        if(num == '1'){
            alert('最后一个无法删除');
            return true;
        }
        $("#addContent div").eq(num-1).remove();

    }
</script>
</body>
</html>
