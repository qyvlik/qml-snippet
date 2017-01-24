import QtQuick 2.0

//! [HTML5 CANVAS画图教程15：画扇形](http://jo2.org/html5-canvas-sector/)

Canvas {

    id: canvas

    property real size: 400
    readonly property real radius: size / 2
    property color color: "blue"

    width: size
    height: size

    property real percent: 0

    NumberAnimation on percent {
        from: 0
        to: 1
        duration: 1000
    }

    Timer {
        repeat: true
//        running: true
        interval: 100
        onTriggered: canvas.requestPaint();
    }

    onPaint: {
        var centerX = canvas.width / 2;
        var centerY = canvas.height / 2;
        var deg = Math.PI/180;
        var sDeg = deg * -90;
        var eDeg = deg * (360 * percent);
        sector(centerX, centerY, radius, sDeg, eDeg);
    }



    function sector(x, y, radius, startDeg, endDeg) {
        // 初始保存
        var ctx = getContext("2d");

        ctx.save();
        // 位移到目标点
        ctx.translate(x, y);
        ctx.beginPath();
        // 画出圆弧
        ctx.arc(0,0,radius,startDeg, endDeg);
        // 再次保存以备旋转
        ctx.save();
        // 旋转至起始角度
        ctx.rotate(endDeg);
        // 移动到终点，准备连接终点与圆心
        ctx.moveTo(radius,0);
        // 连接到圆心
        ctx.lineTo(0,0);
        // 还原
        ctx.restore();
        // 旋转至起点角度
        ctx.rotate(startDeg);
        // 从圆心连接到起点
        ctx.lineTo(radius,0);
        ctx.closePath();
        // 还原到最初保存的状态
        ctx.restore();

        ctx.fill();
    }
}
