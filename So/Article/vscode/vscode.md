#visual studio codeһЩʹ������

##vscode��ΪĬ�ϴ򿪷�ʽ�����º�ʧЧ
> windowsϵͳ�£���vscode����ΪĬ�ϴ򿪷�ʽ�����º����Ҽ�"�򿪷�ʽ"�����б��ﶪʧ��

ԭ������Ϊvscode��������ʽ�ǳ����⣬��װ��vscodeĿ¼�ṹ�������ģ�

> 
	������ app-0.5.0
	��	������ locales    
	��	������ resources  
	��	������ Code.exe      
	������ bin  
	������ packages  
	������ .dead   
	������ app.ico
	������ SquirrelSetup.log
	������ Update.exe
  
����`app-x.x.x`�ļ���һֱ���µģ����統ǰ�汾��0.3.0��������Ϊ`app-0.3.0`��Ҳ����˵��vscodeÿ����һ�ΰ汾�������ɶ�Ӧ���ļ��С�
  
VSע���������ʽ��`Update.exe`�����������ģ�
```
	C:\Users\�û���\AppData\Local\Code\Update.exe --processStart Code.exe
```

��������������`app-x.x.x/Code.exe`��  
Ĭ������`Update.exe`�Ǵ��ݲ����ģ��²�Ӧ����������ʱ��ͨ��`Update.exe`�ȼ����£�û�м�⵽��ȥ���°汾���ļ�����������  
����Զ����º�Ŀ¼ӳ��Ļ����������Ĺ�Ѫ����Ϊ�������ĳЩ�ط�ʹ����ֱ��ָ��vscode�����ļ���̬·�������磺

```
	C:\Users\�û���\AppData\Local\Code\app-0.5.0\Code.exe
```

�ͱ�ʾֱ������vscode 0.5.0����������������򣬵���һ���������£�����vscode���µ���0.6.0����ôָ���·��Ӧ����������

```
	C:\Users\�û���\AppData\Local\Code\app-0.6.0\Code.exe
```

������ľ�̬·��ָ���ʧЧ�ˣ����������`Code.exe`�����Ŀ�ݷ�ʽ��������ֱ����Ч��

�ص���������⣺**vscode���º����Ҽ��򿪷�ʽ�б���ʧЧ**��������Ϊ������⡣

�����ʽ�ܼ򵥣�
- ��ע��� - WIN+R������`regedit`�����`ȷ��`
- �ҵ�ע�������б��"HKEV-CLASSES-ROOT\\APPlications\\Code.exe\\shell\\open\\command"��  
������ HKEV-CLASSES-ROOT  
��	������ APPlications  
��	��	������ Code.exe  
��	��	��	������ shell  
��	��	��	��	������ open  
��	��	��	��	��	������ command  

- �޸�`command`���ֵ��������Ϊ��ȷ��·�������º��·����������ԭ����ֵ�����������ģ�
```
	"C:\Users\�û���\AppData\Local\Code\app-0.3.0\Code.exe" "%1"
```
���޸�Ϊ���°棨������0.5.0��
```
	"C:\Users\�û���\AppData\Local\Code\app-0.5.0\Code.exe" "%1"
```

֮������һ���ļ��Ҽ����"�򿪷�ʽ"���ǲ����ַ���vscode�ˣ�

ԭ���Ҷ��ģ���Ϊvscode����ĸ��·�ʽ������ע���û��ָ����ȷ�ĸ��º���ļ��С�  
��������ֶ�����һ���Ҽ��˵�"�򿪷�ʽ"�����б��ע���

PS.�Ҽ�"�򿪷�ʽ"����һЩʧЧ�ġ���ʧ�ġ������ķ��ĳ������������ע���HKEV-CLASSES-ROOT\\APPlications\\��ɾ����