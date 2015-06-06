<?xml version="1.0" encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:vrutil="xalan://com.sohu.sogou.wap.web.util.VRUtil"
                exclude-result-prefixes="vrutil">
  <xsl:param name="classid"  select="/DOCUMENT/item/classid"/>
  <xsl:output method="html" version="1.0" encoding="GBK" omit-xml-declaration="yes" standalone="yes"/>

  <xsl:template name="css">
    <style type="text/css">
      
      <![CDATA[
.xc-ico{padding-left:19px;background: url(/resource/vr/5/images/xc-ico.png) 0 11px no-repeat;-webkit-background-size: 12px auto;
background-size: 12px auto;}
.sch-opens-box{margin-top: -11px;position: relative;margin-bottom: 11px;}
.sch-form{position: absolute;bottom: 10px;width: 100%;z-index: 2;}
.sch-form ul{margin-left: 11px;zoom: 1;}
.sch-form ul:after{clear: both;content: '';display: block;}
.sch-form ul li{width: 50%;float: left;margin-bottom: 13px;}
.sch-form ul li div{margin-right: 10px;border: 1px solid #bbd8e7;height: 30px;padding: 0 10px;background-color: rgba(255,255,255,.9);}
.sch-form li div input{width: 100%;border: 0;height: 30px;font-size: 14px;color: #262626;-webkit-tap-highlight-color:rgba(255,0,0,0);background-color: transparent;}
.sch-sub-btn{padding: 0 11px;}
.sch-sub-btn input{width: 100%;border: 1px solid #387cd0;height: 32px;background-color: #4289e2;border-radius: 2px;font-size: 14px;color: #fff;-webkit-appearance:none;}
.img-text-box{padding: 4px 11px 0;line-height: 18px;height: 18px;font-size: 12px;}
.sch-opens-box img{width: 100%;display: block;}
.sch-211,.sch-985{color: #fff;height: 14px;line-height: 14px;font-size: 12px;display: inline-block;padding: 0 3px;overflow: hidden;border-radius: 2px;margin-left: 4px;position: relative;top: -2px;}
.sch-211{background-color: #f76d86;}
.sch-985{background-color: #6b9dfc;}
.sch-info{margin: 0 11px;display: inline-block;color: #262626;line-height: 18px;font-size: 12px;margin-top: -3px;}
.sch-info i{font-style: normal;color: #00c;}

.scale-box{padding: 14px 11px 10px;zoom: 1;border-bottom: 1px solid #eee;}
.scale-box:after{display: block;content: '';clear: both;}
.cir-scale{width: 84%;float: left;text-align: center;position: relative;padding: 18px 0;height: 100px;}
.mid-text{width: 40px;height: 30px;font-size: 12px;font-weight: bold;text-align: center;position: absolute;left: 50%;top: 50%;margin: -15px 0 0 -20px;z-index: 1;}
.scale-text-01,.scale-text-02,.scale-text-03,.scale-text-04,.scale-text-05,.scale-text-06{position: absolute;z-index: 2;color: #999;font-size: 12px;line-height: 18px;}
.scale-text-01{top: 0;}
.rect-scale{width: 16%;float: right;text-align: center;}
.rect-scale p{line-height: 18px;font-size: 12px;color: #999;}
.rect-skin{display: inline-block;height: 100px;margin-top: 2px;width: 14px;background-color: #f76d86;}
.rect-skin span{display: inline-block;width: 14px;background-color: #6b9dfc;margin-top: -2px;border-bottom: 2px solid #fff;}
.sch-opans-table{padding: 8px 11px;}
.sch-opans-table table{width: 100%;table-layout: fixed;}
.sch-opans-table th{text-align: left;font-weight: normal;padding: 5px 0;width: 45px;}
.sch-opans-table td{padding: 5px 0;font-size: 12px;}
.sch-opans-table td a{display: block;width: 50px;height: 42px;background-color: #90bcee;color: #fff;border-radius: 3px;padding-top: 8px;text-align: center;float: right;}
.sch-opans-table a:before{height: 20px;width: 25px;display: block;content: '';background: url(/resource/vr/5/images/sch-ico-skin.png) no-repeat;-webkit-background-size: 103px auto;
background-size: 103px auto;margin: 0 auto 4px;}
.sch-opans-table .td-02 a:before{background-position: -26px 0;}
.sch-opans-table .td-03 a:before{background-position: -52px 0;}
.sch-opans-table .td-04 a:before{background-position: -78px 0;}
.sch-opans-table .td-05 a:before{background-position: 0 -21px;}
.sch-opans-table .td-06 a:before{background-position: -26px -21px;}
.sch-opans-table .td-07 a:before{background-position: -52px -21px;}
.sch-opans-table .td-08 a:before{background-position: -78px -21px;}
.sch-search-msg{padding: 6px 0 17px;line-height: 18px;font-size: 12px;text-align: center;color: #777;}
.vr-more span {color: #999;float: left;}
      ]]>
    </style>
  </xsl:template>

  <xsl:template name="round">
    <script>;;;
      <![CDATA[
(function (window, undefined) {
    var option = {
        colors: ['#abd9ea', '#c5b0ed', '#ed7e89', '#fbaca7', '#fed17e', '#a0dcac'],
        breakPx: 0,
        width: 200,
        height: 200,
        start: 0,
        x: 100,
        y: 100,
        lineWidth: 20,
        deep: 40
    },
        extend = function () {
            if (arguments.length !== 2) return {};
            var target = arguments[0] || {},
                source = arguments[1] || {};
            for (var key in source) {
                if (!target[key])
                    target[key] = source[key];
            }
            return target;
        },
        position = function (value) {
            return (value > 0 ? value / 100 : value) * 360;
        },
        val = function (value) {
            //�ٷֱ�ת�Ƕ���ת����
            return (value > 0 ? value / 100 : value) * 360 * Math.PI / 180;
        },
        Round = function (elem, config) {
            if (typeof (elem) === 'string' || elem.nodeType !== 1) {
                elem = document.getElementById(elem.toString());
            };
            config = extend(config, option);
            var canvas = elem && elem.getContext && elem.getContext('2d'),
                start = config.start,
                lastColor = undefined,
                tempRandom = undefined,
                self = {
                    getColor: function (color) {
                        if (color === undefined) {
                            //�����ɫ���ܺ���һ���ظ�
                            while ((tempRandom = Math.floor(Math.random() * config.colors.length)) === lastColor);
                            lastColor = tempRandom;
                            return config.colors[lastColor];
                        }
                        return lastColor = -1 && typeof (color) === 'string' && color.indexOf('#') !== -1 ? color : config.colors[parseInt(color)] || config.colors[parseInt(color) % config.colors.length];
                    },
                    //�����ֵ���հٷֱ�������
                    draw: function (value, color) {
                        if (canvas && value <= 100) {
                            //�����Σ�arc(x���꣬y���꣬�뾶�����λ�����㣬���λ����յ㣬˳ʱ�루true������ʱ�루false��)
                            canvas.arc(config.x, config.y, config.deep, val(start), val(start + value - config.breakPx / 2));
                            //�߿�
                            canvas.lineWidth = config.lineWidth;
                            //����ɫ
                            canvas.strokeStyle = self.getColor(color);
                            //�������Ĳ������������
                            canvas.stroke();
                            canvas.beginPath(); //��ʶ·�����»���

                            //������
                            start += value;
                            //                            /*
                            //                                ���ʽд����
                            //                            */
                            //                            canvas.fillStyle = self.getColor(color);
                            //                            canvas.beginPath(); //��ʼ��ͼ
                            //                            canvas.moveTo(50, 50);
                            //                            canvas.arc(config.x, config.y, config.deep, val(start), val(start + value - config.breakPx));
                            //                            start += value;
                            //                            canvas.fill(); //��ʼ��ͼ
                        }
                        return self;
                    },
                    angle: function () {
                        //��ȡ��ǰ�ܹ��ĽǶ�
                        return start;
                    },
                    reDraw: function (value, color) {
                        //�������ԭ�㿪ʼ��ͼ
                        var temp = start;
                        start = 0;
                        self.draw(value, color);
                        start = temp;
                        return self;
                    },
                    clear: function (x, y, width, height) {
                        if (canvas)
                        //                            canvas.clearRect(0, 0, 100, 120);
                            canvas.clearRect(x || 0, y || 0, width || config.width, height || config.height);
                        return self;
                    }
                };
            return self;
        };

    window.so = window.so || {};
    window.so.Round = Round;
} (window));
    ]]>
    </script>
  </xsl:template>

  <xsl:template name="js">
    <xsl:call-template name="round" />
    <script>;;
      <![CDATA[
(function ($, window, classId, rank, tcurl, downLoadTxt, downLoadUrl) {
    var id = function (value) {
        return 'sogou_vr_' + classId + '_' + rank + '_' + value;
    },
    linkUrl = function (url, linkId) {
        return tcurl + "wml=1&clk=" + rank + "&url=" + encodeURIComponent(url) + '&vrid=' + classId + '&linkid=' + (linkId || "0");
    },
    /*logģ�飬����Ҫɾ��*/
    logDOM = document.getElementById(id('log')),
    log = function (data) {
        if (Object.prototype.toString.call(data) === '[object Object]') {
            var str = ['{'];
            for (var key in data) {
                if (data.hasOwnProperty(key)) {
                    str.push(' ' + key + ' :');
                    str.push(' ' + data[key] + ',');
                }
            }
            str.push('}');
            return;
        }
        logDOM.innerHTML += ('<div>' + data + '</div>');
    },
    logObj = function (fuck) {
        log('<div style="background-color:red;">�������</div>');
        for (var i in fuck) {
            log('{ ' + i + ' : ' + fuck[i] + ' }');
        }
    },
    /*logģ�飬����Ҫɾ��*/
    startCity = '', //��ʼ����
    schoolName = '', //ѧУ����
    vrDOM = $('#' + id('xieChengCon')), //�첽vr��DOM
    XPathEvaluator = window.XPathEvaluator, //xml������ض���
    XPathResult = window.XPathResult,
    // ��Բ��һ�����꣬���������
    circlePoint = function (x, y, r, a) {
        /// <summary>
        ///     1: ��Բ��һ�����꣬���������
        ///     &#10;    1.1 - circlePoint(x,y,r,a)
        /// </summary>
        /// <param name="x" type="Int">
        ///     Բ��x����
        /// </param>
        /// <param name="y" type="Int">
        ///     Բ��y����
        /// </param>
        /// <param name="r" type="Int">
        ///     Բ�뾶
        /// </param>
        /// <param name="a" type="Int">
        ///     Բ�Ƕ�
        /// </param>
        /// <returns type="String" />
        var tmpx = x + r * Math.cos(a * Math.PI / 180);
        var tmpy = y + r * Math.sin(a * Math.PI / 180);
        return { x: tmpx, y: tmpy };
    },
    truncate = function (target, length, truncation, isByte) {
        /// <summary>
        ///     1: �ض�һ���ַ������ṩ�����ضϺ��ֽڽض�
        ///     &#10;    1.1 - truncate(target, length, truncation, isByte)
        ///     &#10;    1.1 - truncate(target, length, isByte)
        /// </summary>
        /// <param name="target" type="String">
        ///     Ҫ�ضϵ��ַ���
        /// </param>
        /// <param name="length" type="String">
        ///     �ضϵĳ���
        /// </param>
        /// <param name="truncation" type="String">
        ///     �ضϺ�׺
        /// </param>
        /// <param name="isByte" type="String">
        ///     �Ƿ����ֽ�ģʽ�ضϣ�Ĭ��false��
        /// </param>
        /// <returns type="String" />
        if (typeof truncation === 'boolean') {
            isByte = truncation;
            truncation = undefined;
        }
        length = length || 30;
        //����null��undefined
        truncation = truncation == undefined ? '...' : truncation;
        if (isByte) {
            var temp = target.replace(/[^\x00-\xff]/g, '\r\n').split('');
            length = temp[length - 1] == '\r' ? length - 2 : length - 1; //convert to index
            //��ʱ������ƴ�ӻ��������õ�����
            //����Ŀ����Ż�����Array��slice����ͨ���հ���������
            temp = Array.prototype.slice.call(temp, 0, length).join('').replace(/\r\n/g, '*').length + 1;
            return temp >= target.length ? target : target.substr(0, temp) + truncation;
        }
        return target.length > 30 ? Array.prototype.slice.call(target, 0, length - truncation.length) + truncation : String(target);
    },
    format = function (str, object) {
        var array = Array.prototype.slice.call(arguments, 1);
        //���Ա�\��ת��
        return str.replace(/\\?\${([^{}])\}/gm, function (match, key) {
            //ƥ��ת���"\"
            if (match.charAt(0) == '\\')
                return match.slice(1);
            var index = Number(key);
            if (index >= 0)
                return array[index];
            return object[key] ? object[key] : match;
        });
    },
    //    document = window.document,
    find = function (xpath, context) {
        /// <summary>
        ///     1: ����xpath����
        ///     &#10;    1.1 - contains(obj)
        /// </summary>
        /// <param name="xpath" type="String">
        ///     xpath
        /// </param>
        /// <param name="context" type="Object">
        ///     ����������
        /// </param>
        /// <returns type="Array" />
        context = context || document;
        if (!xpath) return [];
        //ie:selectNodes

        //webkit||firefox||IE>=10
        var xResult = new XPathEvaluator(), nodes = [], node, nodeList;
        //context��document.documentElement������document
        nodeList = xResult.evaluate(xpath, context, null, XPathResult.ORDERED_NODE_ITERATOR_TYPE, null);
        while (node = nodeList.iterateNext())
            nodes.push(node);
        return nodes;
    },
    loadError = function (msg) {
        vrDOM.html(format(errorTemplent, msg));
    },
    textContent = function (xpath, doc) {
        //xml����ʹ��innerHTML��ȡֵ
        if (xpath && xpath.nodeType) {
            return xpath.firstChild ? xpath.firstChild.nodeValue : '';
        }
        var temp = find(xpath, doc);
        return temp[0] ? textContent(temp[0]) : '';
    },
    loadXML = function (keyword) {
        loadError('���ڼ���...');
        //http://wap.sogou.com/web/yyxml.jsp?keyword=%E5%8C%97%E5%A4%A7&vr=21127201,21125601&cnt=20&ua=Android
        $.ajax({
            type: 'get',
            url: ['/web/yyxml.jsp?keyword=', encodeURIComponent(keyword), '&vr=21127201,21125601&cnt=20&ua=Android'].join(''),
            //            data: { keyword: keyword, vr: encodeURIComponent('21127201,21125601'), cnt: 20, ua: 'Android' },
            contentType: 'application/json',
            dataType: 'xml',
            success: function (data, status, xhr) {
                initPage(xhr.responseXML);
            },
            error: function () {
                loadError('����ʵ���Ҳ�������ҪΪ����');
            }
        });

    },
    //Я�̲���DOM id
    xiechengId = id('xiecheng'),
    //canvas����id
    canvasId = id('scale'),
    //ҳ��canvas����
    roundCanvas,
    //ҳ��ģ��
    errorTemplent = '<div class="sch-search-msg">${0}</div>',
    titleTemplent = '<h3 class="vr-tit"><a class="resultLink" href="${0}">${1}${2}</a></h3>',
    disTemplent = ' <a class="sch-info" href="${0}">${1}<i>&nbsp;��ϸ</i></a>',
    //0��canvasId  1��ÿ��div 2��������������%��  3��Ů������
    roundTemplent = '<div class="scale-box"><div class="cir-scale"><canvas height="100" width="100" id="${0}">�����������֧��</canvas>${1}<div class="mid-text">��Դ�ر���</div></div>${2}</div>',
    ractTemplent = '<div class="rect-scale"><p>��${0}%</p><span class="rect-skin"><span style="height: ${0}px;"></span></span><p>Ů${1}%</p></div>',
    otherTemplent = '<div class="sch-opans-table"><table class="sch-opans-table"><tbody id="${0}"></tbody></table></div>',
    moreTemplent = '<a class="vr-more" href="${0}"><span class="xc-ico">Я����</span>${1}</a>',
    fuckXiechen = '<td class="td-0${0}"><a href="${1}">${2}</a></td>',
    //�ٷֱ�����λ�ü�����ػ�������
    preCompute,
    getCircle = function (angle) {
        var txtPos, result;
        if (!preCompute) {
            preCompute = {};
            //��ȡ��һ��Բ�ĵĵ�
            var cricleDOM = document.getElementById(canvasId);
            preCompute.x = parseInt(cricleDOM.offsetLeft) + 50;
            preCompute.y = parseInt(cricleDOM.offsetTop) + 50;
        }
        result = circlePoint(preCompute.x, preCompute.y, 75, Math.round(angle));
        result.x = Math.round(result.x) - 25; //�������Ҿ���
        result.y = Math.round(result.y) - 4; //�������¾���
        return result;
    },
    convertAngle = function (value) {
        //�ٷֱ�ת�Ƕ�
        return value / 100 * 360;
    },
    initPage = function (xml) {
        if (!xml) return loadError('����ʵ���Ҳ�������ҪΪ����~');
        //var data = $(xml);
        var itemsDOM = [], //[ ѧУxml , ��Դ��xml ]
            keyword = schoolName,
        //�ٷֱȼ���
            roundList = [],
            currDOM = find('/rss/channel/item/vr/vr_xml', xml.documentElement || null),
            html = [], temp = [], deepTemp = [];
        if (!currDOM.length) return loadError('����ʵ���Ҳ�������ҪΪ����~');
        currDOM.forEach(function (item) {
            try {
                //����ĸ�ʽ������
                //                itemsDOM.push((new DOMParser()).parseFromString(textContent(item).replace(/&gt;/g, '>').replace(/&lt;/g, '<'), 'text/xml').documentElement);
                var fuck = new DOMParser();
                var testHTML = textContent(item).replace(/&gt;/g, '>').replace(/&lt;/g, '<');
                var test = fuck.parseFromString(testHTML, 'text/xml');
                var hehe = test.documentElement;
                itemsDOM.push(hehe);
            } catch (e) {

            }
        });
        if (textContent('//display/project_211', itemsDOM[0])) {
            temp.push('<span class="sch-211">211</span>');
        }
        if (textContent('//display/project_985', itemsDOM[0])) {
            temp.push('<span class="sch-985">985</span>');
        }

        html.push(format(titleTemplent, linkUrl(textContent('//display/url', itemsDOM[0]), 2), keyword = textContent('//display/name', itemsDOM[0]).replace(/\ue40a/g, '').replace(/\ue40b/g, ''), temp.join('')));
        temp = [];
        //��ȡ��Դ�ر���
        if (itemsDOM[1]) {
            var ratio = 100, add, list = find('//display/address', itemsDOM[1]), len = list.length;
            if (list.length)
                list.forEach(function (item, i, list) {
                    i += 1;
                    add = item.getAttribute('ratio');
                    ratio -= (add = Math.round(item.getAttribute('ratio')));
                    roundList.push(add = (i === list.length ? ratio + add : add));
                    temp.push('<div class="scale-text-0' + i + '">' + item.getAttribute('name') + add + '%</div>');
                });
            var ract = find('//display/people', itemsDOM[1])[0];
            if (ract)
                deepTemp.push(format(ractTemplent, Math.round(ract.getAttribute('man')), Math.round(ract.getAttribute('woman'))));
        }

        html.push(format(disTemplent, linkUrl(textContent('//display/url', itemsDOM[0]), 3), truncate(textContent('//display/description', itemsDOM[0]), 60, true)));
        html.push(format(roundTemplent, canvasId, temp.join(''), deepTemp.join('')));
        temp = [];
        deepTemp = [];
        html.push(format(otherTemplent, xiechengId));
        html.push(format(moreTemplent, linkUrl(downLoadUrl, 12), downLoadTxt || 'Я��app����'));
        //all done
        vrDOM[0].innerHTML = html.join('');
        roundCanvas = window.so.Round(canvasId, { breakPx: 1, height: 100, width: 100, x: 50, y: 50 });
        var adds = document.getElementById(canvasId).parentNode.getElementsByTagName('div');
        roundList.forEach(function (value, i) {
            roundCanvas.draw(parseInt(value));
            var pos = getCircle(convertAngle(roundCanvas.angle()) - convertAngle(value / 2));
            adds[i].style.left = pos.x + 'px';
            adds[i].style.top = pos.y + 'px';
        });

        loadJSONP(keyword);

    },
    loadJSONP = function (keyword) {
        //Я��load Json
        var url = ['http://openapi.ctrip.com/AMCustomizeSvr/SoGou/SoGouVrKaiXue.ashx?city=', encodeURI(encodeURI(startCity)), '&xuexiao=', encodeURI(encodeURI(keyword)), '&callback=', 'callback' + classId].join(''),
            script = document.createElement('script');
        script.setAttribute('src', url);
        script.setAttribute('charset', "utf-8");
        document.getElementsByTagName('head')[0].appendChild(script);
    }, xieChengFuck = {
        hotel: ['�Ƶ�', 1],
        food: ['��ʳ', 2],
        shop: ['����', 3],
        jingdian: ['����', 4]
    }, xieChengFuck2 = {
        flight: ['��Ʊ', 5],
        train: ['��Ʊ', 6],
        jieji: ['�ӻ�', 7],
        yongche: ['�ó�', 8]
    };
    window['callback' + classId] = function (data) {
        if (data) {
            var html = ['<tr><th>�ܱߣ�</th>'];
            for (var key in xieChengFuck) {
                if (xieChengFuck.hasOwnProperty(key))
                    html.push(format(fuckXiechen, xieChengFuck[key][1], linkUrl(data[key], xieChengFuck[key][1] + 3), xieChengFuck[key][0]));
            }
            html.push('</tr><tr><th>�г̣�</th>');
            for (var key in xieChengFuck2)
                if (xieChengFuck2.hasOwnProperty(key))
                    html.push(format(fuckXiechen, xieChengFuck2[key][1], linkUrl(data[key], xieChengFuck2[key][1] + 3), xieChengFuck2[key][0]));
            html.push('</tr>');
            document.getElementById(xiechengId).innerHTML = html.join('');
        } else {
            //TODO
        }
    };
    //runing code
    (function () {
        var startInput = $('#' + id('start')), startValue,
            schoolInput = $('#' + id('school')), schoolValue,
            submitButton = $('#' + id('getData')),
            temp;
        submitButton.click(function () {
            startValue = startInput.val().trim();
            schoolValue = schoolInput.val().trim();
            if (!startValue) {
                startInput.focus();
                return;
            }
            if (!schoolValue) {
                schoolInput.focus();
                return;
            }
            //�ظ��������
            //          if (startCity === startValue || schoolName === schoolValue) return;
            startCity = startValue;
            schoolName = schoolValue;
            loadXML(schoolName);
        });
    } ());

    ]]>
      } (Zepto, window, '<xsl:value-of select="/DOCUMENT/item/classid"/>', '${i}', '${t}', '<xsl:value-of select="//display/download/@txt"/>', '<xsl:value-of select="//display/download/@link"/>'));
    </script>

  </xsl:template>


  <xsl:template match="/">
    <div class="vrResult">
      <xsl:call-template  name="css" />
      <div class="sch-opens-box">
        <form class="sch-form" method="get" action="">
          <ul>
            <li>
              <div>
                <input type="text" placeholder="�����ص�">
                  <xsl:call-template name="id">
                    <xsl:with-param name="value">start</xsl:with-param>
                  </xsl:call-template>
                </input>
              </div>
            </li>
            <li>
              <div>
                <input type="text" placeholder="����ѧУ">
                  <xsl:call-template name="id">
                    <xsl:with-param name="value">school</xsl:with-param>
                  </xsl:call-template>
                </input>
              </div>
            </li>
          </ul>
          <div class="sch-sub-btn">
            <input type="button" value="������ȡ">
              <xsl:call-template name="id">
                <xsl:with-param name="value">getData</xsl:with-param>
              </xsl:call-template>
            </input>
          </div>
          <div class="img-text-box">��д�����ص�������ѧУ������������Ŀ�ѧ�ܼҡ�</div>
        </form>
        <img alt="" src="/resource/vr/5/images/sch-opens/sch-opans-01.jpg"/>
      </div>
      <div>
        <xsl:call-template name="id">
          <xsl:with-param name="value">xieChengCon</xsl:with-param>
        </xsl:call-template>
      </div>
      <div>
        <xsl:call-template name="id">
          <xsl:with-param name="value">log</xsl:with-param>
        </xsl:call-template>
      </div>
      <xsl:call-template name="js" />
    </div>
  </xsl:template>

  <xsl:template name="id">
    <xsl:param name="name" select="'id'"/>
    <xsl:param name="value"/>
    <xsl:attribute name="{$name}">sogou_vr_<xsl:value-of select="/DOCUMENT/item/classid"/>_${i}_<xsl:value-of select="$value"/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template name="getURL">
    <xsl:param name="enurl"/>
    <xsl:param name="url"/>
    <xsl:param name="url1"/>
    <xsl:param name="wml" select="1"/>
    <xsl:param name="linkid" select="0"/>
    <xsl:param name="hid"/>
    <xsl:attribute name="href">
      <xsl:value-of select="'${t}clk=${i}&amp;url='"/>
      <xsl:choose>
        <xsl:when test="/DOCUMENT/item/request/@v='5' and $url1!=''">
          <xsl:value-of select="URLEncoder.encode($url1,'UTF-8')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="URLEncoder.encode($url,'UTF-8')"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="'%26%24%7Bv%7D&amp;vrid='"/>
      <xsl:value-of select="$classid"/>
      <xsl:value-of select="'&amp;wml='"/>
      <xsl:value-of select="$wml"/>
      <xsl:value-of select="'&amp;linkid='"/>
      <xsl:value-of select="$linkid"/>
      <xsl:if test="$hid!=''">
        <xsl:value-of select="'&amp;h='"/>
        <xsl:value-of select="$hid"/>
      </xsl:if>
    </xsl:attribute>
  </xsl:template>
</xsl:stylesheet>