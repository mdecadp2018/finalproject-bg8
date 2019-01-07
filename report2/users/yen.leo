<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ahshoe.20161120121808.1" a="E"><vh>@settings</vh>
<v t="ahshoe.20170315212615.1"><vh>@data qt-gui-plugin-style-sheet</vh></v>
<v t="ahshoe.20170315212626.1"><vh>@string initial_split_orientation = horizontal</vh></v>
</v>
<v t="yen.20170429110328.1" a="E"><vh>Installation</vh>
<v t="yen.20170429110336.1"><vh>Ubuntu 14.04</vh></v>
<v t="leo.20171119233721.1"><vh>Windows</vh></v>
<v t="leo.20171119233845.1"><vh>fontspec error</vh></v>
</v>
<v t="40323230.20170123213451.1"><vh>@button Report pdf</vh></v>
<v t="yen.20170429132400.1"><vh>協同著作規劃</vh></v>
<v t="yen.20170429103742.1" a="E"><vh>@path ./../</vh>
<v t="yen.20170429103940.1" a="E"><vh>@path markdown</vh>
<v t="40323230.20170130135731.1"><vh>@edit template.tex</vh></v>
<v t="ahshoe.20170322182713.1"><vh>@edit reference.md</vh></v>
<v t="ahshoe.20170322181453.1"><vh>@edit refer.bib</vh></v>
<v t="leo.20171119234752.1" a="E"><vh>封面以及摘要</vh>
<v t="ahshoe.20161120122151.1" a="E"><vh>@clean cover_and_abstract.md</vh>
<v t="ahshoe.20170317115820.1"><vh>摘要</vh></v>
</v>
</v>
<v t="leo.20171119234822.1" a="E"><vh>各章節內容</vh>
<v t="yen.20170429214845.1" a="E"><vh>@path paragraph</vh>
<v t="yen.20170429214838.1" a="E"><vh>@clean foreword.md</vh>
<v t="yen.20170429214838.3"><vh>前言</vh></v>
</v>
<v t="yen.20170429215041.1" a="E"><vh>@clean components.md</vh>
<v t="leo.20190105111002.1"><vh>Escapement</vh></v>
<v t="yen.20170429215130.1"><vh>Gear</vh></v>
<v t="leo.20190105111005.1" a="M"><vh>Pointer</vh></v>
<v t="leo.20190106201752.1" a="M"><vh>Clock</vh></v>
</v>
<v t="leo.20190106202923.1" a="E"><vh>@clean Assembly.md</vh>
<v t="leo.20190106204241.1" a="M"><vh>Assembly front</vh></v>
<v t="leo.20190106202923.5" a="M"><vh>Assembly back</vh></v>
</v>
<v t="yen.20170429215252.1" a="E"><vh>@clean divide_the_work.md</vh>
<v t="leo.20190105174003.1"><vh>專案分工</vh></v>
</v>
<v t="yen.20170429215416.1"><vh>@clean Conclusion.md</vh>
<v t="yen.20170429215446.2"><vh>結論</vh></v>
</v>
<v t="yen.20170429215617.1"><vh>@clean Discussion_and_suggestion.md</vh>
<v t="leo.20190106155929.1"><vh>速度是否相同</vh></v>
<v t="yen.20170429215851.1"><vh>準確表示時間</vh></v>
</v>
</v>
</v>
</v>
<v t="ahshoe.20170129120932.1" a="E"><vh>Readme</vh>
<v t="ahshoe.20170129120858.1"><vh>@edit README.md</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="40323230.20170123213451.1">@language python
filename = "report2"
import os, platform
import chapter
# 更換目錄到 markdown 
os.chdir("./../markdown")

# 若在 Linux 環境則使用 ukai.ttc 系統字形
if platform.system().lower()=="linux": font = "ukai.ttc"
# 在 windows 環境使用 SimSun 字形
elif platform.system().lower()=="windows": font = "SimSun"
else: font = "Arial"
fontsize = "12"
margin = "1in"
# --pdf-engine 使用 xelatex
# lang 請參照 https://tools.ietf.org/html/bcp47, 這裡的 zh-cmn 為 Mandarin Chinese 國語
# -V lang=zh-cmn 為一組 key=value 對應的 Variable 設定
# -N 表示 Number section headings in LaTeX, ConTeXt, HTML, or EPUB output. By default, sections are not numbered.
settingFlag = "--pdf-engine=xelatex -V lang=zh-cmn -N --toc --highlight-style kate -V documentclass=report  --filter pandoc-fignos --filter pandoc-tablenos --template=template.tex -V \"CJKmainfont:{0}\" -V fontsize={1}pt -V geometry:margin={2} --bibliography=refer.bib --csl=ieee.csl".format(font, fontsize, margin)
print("---Pandoc---")

# 選擇所要納入的 Markdown 檔案, 不納入的檔案名稱前方加上  # 即可
chapter_list = " ".join("./paragraph/" + i for i in [
#"computer_hardware.md",
#"operating_system.md", 
"foreword.md",
"components.md", 
"Assembly.md", 
"divide_the_work.md", 
"Conclusion.md", 
"Discussion_and_suggestion.md", 
#"computer_aided_design.md", 
#"leo_editor.md", 
#"github.md", 
#"fossil.md", 
#"onshape.md", 
#"cmsimfly.md", 
#"pygrouf.md", 
#"pyslvs.md", 
#"pylinkage.md", 
#"pyduino.md", 
])

# 若系統並未正確轉檔, 可以將 os.system 改為 g.es 表示要使用 Leo Editor 的 global 物件中的 echo string 將指令印在 log 區
# 然後複製指令, 然後在命令列視窗中的 markdown 目錄中執行, 就可以得到錯誤訊息
# 或許可以再從 https://stackoverflow.com/questions/26005583/return-value-of-x-os-system 中的建議改進此一指令
os.system("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag))
g.es("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag))
g.es("PDF 轉換完畢")
print('-'*12)</t>
<t tx="ahshoe.20161120121808.1"></t>
<t tx="ahshoe.20161120122151.1">---
university_zh: '國立虎尾科技大學'
institute_zh: '機械設計工程系'
category_zh: '電腦輔助設計實習 bg8 期末報告'
title_zh: '機械計時器運動系統設計與製作'
title_en: 'Design and Manufacturing of an Mechanical Timer Project'
author:
- 設計二乙 高宇辰 40623242
- 設計二乙 郭祐齊 40623241
- 設計二乙 盧逸誠 40623243
- 設計二乙 鄭清銓 40623226
- 設計二乙 陳宥安 40623229
- 設計六乙 王文澤 40223208

advisor_zh: '嚴家銘'
date: '2019.01.06'
---

@others
</t>
<t tx="ahshoe.20170129120932.1"></t>
<t tx="ahshoe.20170315212615.1">QTreeWidget {
    /* These apply to the selected item, but not to editing items.*/
    background-color: #ffffec; /* Leo's traditional tree color */
    selection-color: black; /* was white */
    selection-background-color: lightgrey;
    /* font-family: SansSerif; */
    /*font-family: DejaVu Sans Mono;*/
    font-family:YaHei Mono;
    /* 標題字型大小設定 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
 }

/* Headline edit widgets */
QTreeWidget QLineEdit {
    background-color: cornsilk;
    selection-color: white;
    selection-background-color: blue;
    /*font-family: DejaVu Sans Mono;*/    
    font-family:YaHei Mono;
    /* 沒有特別對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The log panes */
QTextEdit {
    background-color: #f2fdff;
    selection-color: red;
    selection-background-color: blue;
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* log font 大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The body pane */
QTextEdit#richTextEdit {
    background-color: #fdf5f5; /* A kind of pink. */
    selection-color: white;
    selection-background-color: red;
    /*font-family: DejaVu Sans Mono;*/
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* 內文字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

QLabel {
    font-family:YaHei Mono;'CherryPy', 'pytz', 'mako', 'beautifulsoup4', 'pymysql', 'peewee'
    /* 下方的 Minibuffer 標題字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

/* Editor labels */
QLineEdit#editorLabel {
    background-color: #ffffec;
    font-family:YaHei Mono;
    /* 沒有直接對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
    border: 2px;
    margin: 2px;
}</t>
<t tx="ahshoe.20170315212626.1">horizontal: body pane to the left
vertical: body pane on the botton</t>
<t tx="ahshoe.20170317115820.1">---
abstract: |
    在現今的社會機械計時器的存在越來越稀少，漸漸的被電子產業吞噬，但其實最精準、最穩定的還是機械式的，因為在未來往電子化工業發展，許多最基礎技術、最具專業性的技術都將被汰換，而純手工的機械計時器卻永垂不朽，一分一秒的跳動，齒輪一部部的轉動，含有許多令人為嘆為觀止的技術，深具魔力，價值永遠不輸現今的技術，因此我們在選擇專題時，決定選擇探討計時器的基本技術以及設計出深具個人特質的的機械計時器，從程式到設計一併研究，選擇增進自己，不被社會淘汰，為未來保留最有價值及魔力的技術。

    ![Mechanical timer][]
    
    
    [Mechanical timer]: G:/p37-18.11/p37-18.11/tmp/finalproject-bg8/report/markdown/images/cover_and_abstract/Mechanical timer.jpg {#fig:機械計時器}


    
---
</t>
<t tx="leo.20171119233721.1">1. 下載可攜pandoc-2.0.2與 miktex_portable

2. 安裝 pandoc-fignos, pandoc-tablenos filters

python -m pip install pandoc-fignos pandoc-tablenos

3. 若需要安裝 package, 需要用 administrator 身分啟動

c:\users\cadlab\desktop\mde\python2017fall_36\data\miktex_portable\miktex-portable.cmd</t>
<t tx="leo.20171119233845.1">https://sourceforge.net/p/miktex/discussion/33790/thread/fcf98fa1/</t>
<t tx="leo.20171119234752.1"></t>
<t tx="leo.20171119234822.1"></t>
<t tx="leo.20190105111002.1">Escapement  
---

擒縱器是使用於鐘錶的必要零件，在鍾錶史上，人們花在擒縱系統上的精力比鍾錶的任何功能都要多。18世紀，當現在大多數系統都已經被發明時，擒縱系統不只是鍾錶的基礎配置，更是聲譽的象徵。都在不斷研究，想找到解決穩定性和精確度問題的辦法，也是最大困擾。就像在運行的列車與調節器之間的介面一樣，擒縱系統就是動力與頻率之間一個非常複雜的鏈接。提高它的效率對整個機制，動力儲存，精確度，使用壽命和聲譽都會有很大的影響。
    

![Escapement][]
    
    
[Escapement]: G:/p37-18.11/p37-18.11/tmp/finalproject-bg8/report/markdown/images/components/Escapement.jpg {#fig:擒縱器}
</t>
<t tx="leo.20190105111005.1">Pointer 
---

不同軸上裝上不同長度的大小的指針，透過齒輪的不同轉速比，得到計時的效果。
    

![左圖為時針 右圖為分針][]
    
    
[左圖為時針 右圖為分針]: G:/p37-18.11/p37-18.11/tmp/finalproject-bg8/report/markdown/images/components/hand.jpg {#fig:指針}

</t>
<t tx="leo.20190105174003.1">Project Divide 
---

Table: 專案分工 {#tbl:工作分配表}

| Student Nember | Name | Work |
|:--------------------:|:----------:|:----------------------------------------------------------------------------------:|
| 40623242 | 高宇辰 | 網站維護更新、製作PDF、簡報、部落格、上台報告 、出缺席 |
| 40623241 | 郭祐齊 | 製作Onshape手冊、更新心得 |
| 40623226 | 鄭清銓 | 繪製齒輪與組合、更新心得 |
| 40623243 | 盧逸誠 | 繪製齒輪、更新心得 |
| 40623229 | 陳宥安 | 更新心得 |
| 40223208 | 王文澤 | 繪製擒縱器、更新心得 |
</t>
<t tx="leo.20190106155929.1">Q1:模數相同大小不同的齒輪，速度是否相同?

A1:齒數與徑節與模數有關，選擇模數比相同的齒輪，移動速度是相同的，但轉速的話，因為轉速比等於齒速比的反比，故小齒轉速比大齒快。



</t>
<t tx="leo.20190106201752.1">Clock panel
---

做出類似時鐘的面板，可以更精確的表示出計算時間。
    

![Clock panel][]
    
    
[Clock panel]: G:/p37-18.11/p37-18.11/tmp/finalproject-bg8/report/markdown/images/components/clock panel.jpg {#fig:面板}


</t>
<t tx="leo.20190106202923.1">Assembly
===

組合圖

@others
</t>
<t tx="leo.20190106202923.5">Assembly back
---

背面組合圖 (尚未完成)

![背面][]
    
    
[背面]: G:/p37-18.11/p37-18.11/tmp/finalproject-bg8/report/markdown/images/Assembly/Assembly back.jpg {#fig:後視圖}

</t>
<t tx="leo.20190106204241.1">Assembly front
---

正面組合圖 (尚未完成)

![正面][]
    
    
[正面]: G:/p37-18.11/p37-18.11/tmp/finalproject-bg8/report/markdown/images/Assembly/Assembly.jpg {#fig:前視圖}

</t>
<t tx="yen.20170429103742.1"></t>
<t tx="yen.20170429103940.1"></t>
<t tx="yen.20170429110328.1"></t>
<t tx="yen.20170429110336.1">1. 下載並安裝 Pandoc：

https://github.com/jgm/pandoc/releases/

2. 安裝 texlive (安裝 texlive-lang-cjk 而非 16.04 的 texlive-lang-chinese)

sudo apt install texlive texlive-xetex texlive-lang-cjk etoolbox

3. 安裝 pandoc-fignos, pandoc-tablenos filters

sudo pip3 install pandoc-fignos pandoc-tablenos

4. 安裝 ukai.ttc 字型

sudo apt-get install fonts-arphic-ukai</t>
<t tx="yen.20170429132400.1">每一位協同人員各在 users 目錄中建立一個 .leo 檔案

除非必要否則不更動 markdown 目錄下的 template.tex 檔案</t>
<t tx="yen.20170429214838.1">前言
===



@others
</t>
<t tx="yen.20170429214838.3">我們製作的是機械計時器，以最基本的小時、分鐘、秒的計算來繪製齒輪，雖然不具備多功能不過可以使我們更加的了解個零件的磨合以作動，更加快速以及順利，使用重力時鐘做代表。電子時鐘漸漸取代機械時鐘，不過最基礎的東西是不能忘的，所以我們就選擇了設計機械計時器做為我們這組的主題，機械計時器擁有最基礎的齒輪設計排列加上重力的上下運動設計出可以計算時間的機械。


![Gears][]
    
    
[Gears]: G:/p37-18.11/p37-18.11/tmp/finalproject-bg8/report/markdown/images/foreword/GEARS.jpg {#fig:計時器}
</t>
<t tx="yen.20170429214845.1"></t>
<t tx="yen.20170429215041.1">Components
===

機械計時器各部位介紹

@others
</t>
<t tx="yen.20170429215130.1">Gears 
---

不同齒數的齒輪互相嚙和，得到不同的轉速比，因此可得到計時的效果，利用齒輪數的組合，可變換軸轉換的相關速度，可使用在平行軸、相交軸、交錯軸上。
    

![左圖為9T 右圖為96T][]
    
    
[左圖為9T 右圖為96T]: G:/p37-18.11/p37-18.11/tmp/finalproject-bg8/report/markdown/images/components/gear.jpg {#fig:齒輪}

</t>
<t tx="yen.20170429215252.1">Divide the Work
===


@others
</t>
<t tx="yen.20170429215416.1">Conclusion 
===


@others
</t>
<t tx="yen.20170429215446.2">機械計時器在工業上佔有非常雄厚的地位，精密的程度不輸給電子式，一點點小誤差都可能導致不準確，因為本次的專題中了解到，越是基本的東西，越是重要，看似簡單的東西其實是有它難的地方，也有它複雜的地方，看到其他組的表現，只能說我們還需要補足的東西很多，或許之前學長們都沒有甚麼做過類似的專題，也比較少參考資料，但還是做得很不好，也學到團隊的重要性，只有少數的人員想做好是很不足夠的。


</t>
<t tx="yen.20170429215617.1">Discussion and suggestion 
===


@others
</t>
<t tx="yen.20170429215851.1">Q2:時、分、秒針要如何確定能準確表示時間?

A2:需要找出相對齒輪它們之間的的最小公倍數的齒數，若不是最小公倍數會導致時間的不準確。



</t>
</tnodes>
</leo_file>
