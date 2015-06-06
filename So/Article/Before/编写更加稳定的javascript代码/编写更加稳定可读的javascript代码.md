# ��д�����ȶ�/�ɶ���javascript���� #
<div class="l-index">
ÿ���˶����Լ��ı�̷��Ҳ�޿ɱ����Ҫȥ���ܱ��˵ı�̷�񡪡��޸ı��˵Ĵ��롣"�޸ı��˵Ĵ���"����������˵��һ����ʹ������顣��Ϊ��Щ���벢������ô�����Ķ�����ά���ģ�����һ�������޸ı��˵Ĵ��룬��������ֻ���޸�һ������������һ�������ĵ���ʱ����ȴ��Ҫ����1��Сʱ���������ʱ�����Ķ���������˵Ĵ��롣����һ���������ع�һ�λ�ȡλ�õ�"���"�����������javascript����Ŀɶ��Ժ��ȶ��ԡ�
</div>
> �����������£�  
>  
> - �������javascript����
> - ������Ӧ�ù��������ⲿ����
> - ���廯�͸���
> - ���Ӧ�ù�ע�߼�����Ϊֻ�Ƿ�װ
> - �γ��Լ��ķ��Ĵ���

## �������javascript���� ##
����һ�δ�����ʾ�������Ķ�/�޸ĵĴ��룺  
```javascript
(function (window, namespace) {
    var $ = window.jQuery;
    window[namespace] = function (targetId, textId) {
        //һ�����Ը��õĻ�ȡλ�õ�"���"
        var $target = $('#' + targetId),//��ť
            $text = $('#' + textId);//��ʾ�ı�
        $target.on('click', function () {
            $text.html('��ȡ��');
            var data = '������';//balabala�ܶ��߼���α���룬��ȡ�õ�λ����
            if (data) {
                $text.html(data);
            } else
                $text.html('��ȡʧ��');
        });
    }
})(window, 'linkFly');

```
��һ�δ��룬���������Ͽ����Ѿ�����һ��"���"��  
����Ĵ�����ǵ��͵�һ�������㶨�������飬һ��������ڲ����߼��ͻ��������������һ���������������ȡλ�÷��ص����ݸ�ʽ��Ҫ�ӹ�����ô��Ҫȥ����Ѱ�Ҵ������ݵĴ���Ȼ���޸ġ�
  
���Ƿ���һ���߼����õ��������£�
```javascript
(function (window, namespace) {
    var $ = window.jQuery,
        $target,
        $text,
        states= ['��ȡ��', '��ȡʧ��'];
    function done(address) {//��ȡλ�óɹ�
        $text.html(address);
    }
    function fail() {
        $text.html(states[1]);
    }
    function checkData(data) {
        //���λ����Ϣ�Ƿ���ȷ
        return !!data;
    }
    function loadPosition() {
        var data = '������';//��ȡλ����
        if (checkData(data)) {
            done(data);
        } else
            fail();
    }
    var init = function () {
        $target.on('click', function () {
            $text.html(states[0]);
            loadPosition();
        });
    };
    window[namespace] = function (targetId, textId) {
        $target = $('#' + targetId);
        $text = $('#' + textId);
        initData();
        setData();
    }
})(window, 'linkFly');
```
## ������Ӧ�ù��������ⲿ���� ##

����Ĵ����У������Ѿ�������������и���˸��ֺ�����ע��������˵���Ǻ��������Ƿ����������ﳣ����һ���µ����⣺���������������ɿصı�����

����*$target*��*$text*��Ϊ�����е�ȫ�ֱ������������ʼ���㸳ֵ���������и��Ĵ��������Ĳ�������������$text��������$text��*done()*��*fail()*֮�������Ĺ�ϵ��һ��$text��صĽṹ���߼��ı䣬��ô���ǵĴ��뽫����в�С�ĸĶ���  

��ҳ��/DOM��صĶ��ǲ��������ģ�����$target��$text����һ��ҳ��ṹ�����ı䣬������Ϊ�ܴ�̶���Ҳ����֮�ı䡣������Ҳ��Ӧ�������ⲿ�Ļ�����
�ڲ��ɿصı����ϣ�����Ӧ�ý⿪���������������ϵĹ�ϵ���ú�����ø���רע�Լ�������߼������ӵĴ��⡣�򵥵�˵���������������ⲿ��������Ӧ��ͨ���������ݵ������ڲ���
�µĴ������£�

```javascript
(function (window, namespace) {
    var $ = window.jQuery;
    //���λ����Ϣ�Ƿ���ȷ
    function checkData(data) {
        return !!data;
    }
    //��ȡλ����
    function loadPosition(done, fail) {
        var data = '������';//��ȡλ����
        if (checkData(data)) {
            done(data);
        } else
            fail();
    }
    window[namespace] = function (targetId, textId) {
       var  $target = $('#' + targetId),
            $text = $('#' + textId);
        var states = ['��ȡ��', '��ȡʧ��'];
        $target.on('click', function () {
            $text.html(states[0]);
            loadPosition(function (address) {//��ȡλ�óɹ�
                $text.html(address);
            }, function () {//��ȡλ��ʧ��
                $text.html(states[1]);
            });
        });
    }
})(window, 'linkFly');
```

## ���廯�͸��� ##

����*states*��һ�����飬����������Ϊ�����Ķ���ÿ�ο���*states&#91;0&#93;*����һ�ַַ���������ԭ���ߵĳ嶯����Ϊ��������Ҫ��ס����*states*��ֵ���ڴ����ϣ�����Ӧ�þ������������Ժܺõı��Ķ���

���⣬����Ĵ�����$text.html���ǵ��͵Ĵ����ظ���������һ�ε��޸Ĵ��룬��ע����һ���޸ĵĴ����У������������*changeStateText()*�Ĵ���λ�ã�����û�б���������һ�㻷���У�Ҳ����������հ��Ļ�������

```javascript
(function (window, namespace) {
    var $ = window.jQuery;
    function checkData(data) {
        return !!data;
    }
    function loadPosition(done, fail) {
        var data = '������';//��ȡλ����
        if (checkData(data)) {
            done(data);
        } else
            fail();
    }
    window[namespace] = function (targetId, textId) {
        var $target = $('#' + targetId),
            $text = $('#' + textId),
            changeEnum = { LOADING: '��ȡ��', FAIL: '��ȡʧ��' },
            changeStateText = function (text) {
                $text.html(text);
            };
        $target.on('click', function () {
            changeStateText(changeEnum.LOADING);
            loadPosition(function (address) {
                changeStateText(address);
            }, function () {
                changeStateText(changeEnum.FAIL);
            });
        });
    }
})(window, 'linkFly');
```

�ἰ���廯�����Ǳ���Ҫ֪����ǰ����������߼������壺  

������������У����еĺ���ģ����Է�Ϊ��*����*��*�����ṩ��*��

��һ�㻷����������հ��������ǵ�ҵ���а�����*����*����ݣ����������ǵ���һ�׺ͻ�ȡλ���߼���صĹ��ߣ�����*window&#91;namespace&#93;)*�����У�����*�����ṩ��*����ݣ�����Ψһ����ڣ������ṩ���������ҵ������ߵ�ʹ���ߡ�
�����*$text.html()*���߼��ϲ������ڹ��ߣ��������ڹ����ṩ��ʹ�ù��ߺ����õ��ķ���������*changeStateText()*�������ڹ����ṩ��window&#91;namespace&#93;()�С�


## ���Ӧ�ù�ע�߼�����Ϊֻ�Ƿ�װ ##

����Ϊֹ�����Ƿ����˺���������������ӵ�������õ����塣����ʱ�������µ����󣺵�û�л�ȡ��λ�õ�ʱ����Ҫ����һЩ�����Ĳ�������ʱ��ᷢ�֣�������Ҫ*window&#91;namespace&#93;()*�ϼ����µĲ�����
�����Ǽ����µĲ���֮���ֱ���֪�µ����󣺵���ȡλ��ʧ����֮����Ҫ�޸�һЩ��Ϣ��Ȼ���ٴγ��Ի�ȡλ����Ϣ��
�����Һã����ǵĴ����Ѿ��Ѵ󲿷ֵ��߼����뵽�˹����ṩ�����ˣ����������ߵ��߼�Ӱ�첢����
ͬʱ�����ٿ�������ͻᷢ�����ǵ�������˹����ṩ��֮�⣬û�з����������ڶ����ϵĺ�������Ҳ����˵�����ǵ������û�ж���

**�Ҽ����ܶ��˵Ĵ�������ϲ�����칤���ṩ�ߣ��������˹��ߵı��ʡ�**ӭ����������ӵ�������ô���ǵĹ����ṩ�߽�����Խ��Խ�أ���ʱ������Ӧ��˼�������ǲ���Ӧ�ðѹ����ṩ��ȥ��

�����ǻص���������󡪡�����ֻ��һ����ȡλ�õ������û�����ĺ���ҵ����ǻ�ȡλ�á�������Ӧ�ñ�����������ı���Ӧ���Ǹ����߶��󣬶���Ӧ�ú�ҳ����أ����Ǵ�һ��ʼ�Ͳ�Ӧ�ù�עҳ���ϵı仯���������ع��������£�

```javascript
(function (window, namespace) {
    var Gps = {
        load: function (fone, fail) {
            var data = '������';//��ȡλ��α����
            this.check(data) ?
                done(data, Gps.state.OK) :
                fail(Gps.state.FAIL);
        },
        check: function (data) {
            return !!data;
        },
        state: { OK: 1, FAIL: 0 }
    };
    window[namespace] = Gps;
})(window, 'Gps');
```
���������ֱ�������˹����ṩ�ߣ�����ֱ�ӽ������ṩ������Ĺ���ʹ���ߣ��ù���ʹ����ֱ��ʹ�����ǵĹ��ߣ�����Ĵ����޹�״̬���޹�ҳ�档

���ˣ��ع���ɡ�

## �γ��Լ����Ĵ��� ##

֮���Խ��������Ϊ��Ҷ����Լ��ı�̷����Щ�˵ı�̷����ǿ�ƪ���ִ����...
�Ҿ����γ��Լ��ı�̷���ǽ��������ô���ĺͽṹ/�����ϵġ�����ֻ������Ĵ�����Խ��Խ�Ѷ���Խ��Խ��д��
****
**��var�Ͷ�var**
�Ҹ�����ϲ����var���ģ������Ҿ��ô��뻹�Ǿ�������ʹ��ĳһ����/����ʹ��ǰ����var����ʱ��������Ϊ�˵�var�����ɥ�Ĳ����������ֹ��ֵ�ϲ��[�������ʽ����][1]���������ʽ������������var�����ִ�У�����ż����������ֱ�������ִ�еĴ��룬Ϊ�˲��̻�С���ѾͲ���������(�Ҳ������������ʵ�����Ҳ�����)��

**�������Ե�����**
����Ĵ�����ʾ�����ֶ���Ĺ�������һ��ͨ���հ����ڲ��������أ�ͬ�������ַ�����ʵ������new�����Ҹ���...�ǲ�ϲ�������ܶ�this��..�������Ƽ�ǰ�ߡ�

```javascript
(function () {
    //��һ�֣���¶��_name����
    var Demo = function () {
        if (!(this instanceof Demo))
            return new Demo();
        this._name = 'linkFly';
    };
    Demo.prototype.getName = function () {
        return this._name;
    }

    //�ڶ��֣���һ��հ���ζ�ڴ����ĸ��󣬵���������_name����
    var Demo = function () {
        var name = 'linkFly';
        return {
            getName: function () {
                return name;
            }
        }
    }
});
```

**���ñ����ö�&#91;hoisting&#93;**
���ú���������[�����ö�][2]������ζ�Ŵ�Ů����̬���������var����ȴ��������ĺ����ڴ���ṹ��ʮ����������������Ĵ��룺
```javascript
(function () {
    var names = [];
    return function (name) {
        addName(name);
    }
    function addName(name) {
        if (!~names.indexOf(name))//������������
            names.push(name);
        console.log(names);// ["linkFly"]
    }
}())('linkFly');
```
**if��&&**
���ִ��룬�ڼ���Ⱥ�ﶼ�������ۣ�
```javascript
(function () {
    var key = 'linkFly',
        cache = { 'linkFly': 'http://www.cnblogs.com/silin6/' },
        value;
    //&&����
    key && cache && cache[key] && (value = cache[key]);
    //����if
    if (key && cache && cache[key])
        value = cache[key];
})()��
```

��ž��뵽��ôЩ�ˣ���ͻȻ�����Ҳ�̫�Ƽ��Ĵ��룬������д�Ĵ��룬�塣�����λҲ���и�����Ȥ�Ĵ��룬ϣ����λ�������ͳ�����С�ܼ�ʶ��ʶ��

<div class="l-author">
<div>���ߣ�linkFly</div>
<div>ԭ�ģ�<a href="http://www.cnblogs.com/silin6/p/4273511.html" style="color: #259ec7;">http://www.cnblogs.com/silin6/p/4273511.html</a></div>
<div>������<a href="http://www.cnblogs.com/silin6/" style="color: #259ec7;">www.cnblogs.com/silin6/</a></div>
<div>�������٣��㶼����������ôһ����ˣ��Ҿ�����Ӧ��Ҳ������˳�㿽����һС�Σ�ϣ�����ܹ���ÿһ�ε������ж�������һ���������������ߵ������Ͷ��ɹ��������벩��԰����</div>
</div>
**���겻Ҫ�����Ƽ�Ӵ**

  [1]: http://www.cnblogs.com/TomXu/archive/2011/12/29/2290308.html
  [2]: http://openwares.net/js/javascript_declaration_hoisting.html
