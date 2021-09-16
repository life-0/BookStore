(function ($) {

    $(document).ready(function () {
        //初始化图片框: 如果没从数据库中查找到图片路径,则初始化为默认的预设图片

        $('.book_image_load').ready(function () {
            let image = $('.image');
            image.each(function () {
                console.log($(this).attr('src') + ":");
                if ($(this).attr('src') === '') {
                    $(this).attr('src', '/img/default.png');
                }
            });
        });


        //匹配文件后缀
        function matchSuffix(data) {
            if (data.match(/.png|.jpg|.jpeg/)) {
                return true;
            } else {
                window.alert('上传错误,文件格式必须为：png, jpg, jpeg ');
                return false;
            }
        }

        function limitSize(fileSize) {
            if (fileSize > (3 * 1024 * 1024)) {
                window.alert("图片大小必须小于3MB")
                return false;
            } else {
                return true;
            }
        }

        $('.switchImage').on('change', function () {
            let filePath = $(this).val(); //获取到input的value，里面是文件的路径
            let imagePath = $('.image').attr("src");    //获取图片路径
            let fileSize = this.files[0].size; //获取文件大小
            let fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();
            // 检查是否是图片
            if (!matchSuffix(fileFormat)) {
                //获取原先数据的路径
                $(this).attr('type', 'text');
                $(this).val(imagePath);
                console.log($(this).val());
                $(this).attr('type', 'file');
                return;
            }
            if (!limitSize(fileSize)) {
                $(this).attr('type', 'text');
                $(this).val(imagePath);
                console.log($(this).val());
                $(this).attr('type', 'file');
                //$(this).val(imagePath);//获取原先数据的路径
                return;
            }
            let src = window.URL.createObjectURL(this.files[0]); //转成可以在本地预览的格式
            $('#imag').attr('src', src);
        });
    });
})(jQuery);