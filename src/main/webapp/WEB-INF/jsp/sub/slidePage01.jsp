<%@ page pageEncoding="utf-8"%>

<div class="board_slide" style="width:100%; height: 100%;"><!--  border: 1px solid #48BAE4; -->
    <!-- 1~4 line start -->
    <c:forEach begin="1" end="2" step="1" varStatus="theCount">
        <!-- 전체 div -->
        <div> <!-- style="clear: both;" -->
            <!-- 현황판 div01 start -->
            <div id="factory01" class="factory01" style="float: left; width: 70%">
                <!-- theCount.index line 
                <div style="width:100%; border: 1px solid #48BAE4;">
                    <div>
                        <span class="span_bz">&nbsp; ${theCount.index} Line</span>
                    </div>
                </div>
                -->
                
                <div class="row" id="row01">
                    <a href="#" class="col-3" id="${theCount.index}_1a"><!-- onclick="fn_showPopUp()" -->
                        <p class="titlebox" id="${theCount.index}_1"></p>
                        <p class="textbox" id="${theCount.index}_1t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_2a" >
                        <p class="titlebox" id="${theCount.index}_2"></p>
                        <p class="textbox" id="${theCount.index}_2t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_3a" >
                        <p class="titlebox" id="${theCount.index}_3"></p>
                        <p class="textbox" id="${theCount.index}_3t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_4a" >
                        <p class="titlebox" id="${theCount.index}_4"></p>
                        <p class="textbox" id="${theCount.index}_4t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_5a" >
                        <p class="titlebox" id="${theCount.index}_5"></p>
                        <p class="textbox" id="${theCount.index}_5t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                </div>
                
                <div class="row">
                    <a href="#" class="col-3" id="${theCount.index}_6a" >
                        <p class="titlebox" id="${theCount.index}_6"></p>
                        <p class="textbox" id="${theCount.index}_6t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_7a" >
                        <p class="titlebox" id="${theCount.index}_7"></p>
                        <p class="textbox" id="${theCount.index}_7t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_8a" >
                        <p class="titlebox" id="${theCount.index}_8"></p>
                        <p class="textbox" id="${theCount.index}_8t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_9a" >
                        <p class="titlebox" id="${theCount.index}_9"></p>
                        <p class="textbox" id="${theCount.index}_9t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_10a" >
                        <p class="titlebox" id="${theCount.index}_10"></p>
                        <p class="textbox" id="${theCount.index}_10t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                </div>
                
                <div class="row">
                    <a href="#" class="col-3" id="${theCount.index}_11a" >
                        <p class="titlebox" id="${theCount.index}_11"></p>
                        <p class="textbox" id="${theCount.index}_11t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_12a" >
                        <p class="titlebox" id="${theCount.index}_12"></p>
                        <p class="textbox" id="${theCount.index}_12t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_13a" >
                        <p class="titlebox" id="${theCount.index}_13"></p>
                        <p class="textbox" id="${theCount.index}_13t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_14a" >
                        <p class="titlebox" id="${theCount.index}_14"></p>
                        <p class="textbox" id="${theCount.index}_14t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_15a" >
                        <p class="titlebox" id="${theCount.index}_15"></p>
                        <p class="textbox" id="${theCount.index}_15t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                </div>
                
                <div class="row">
                    <a href="#" class="col-3" id="${theCount.index}_16a" >
                        <p class="titlebox" id="${theCount.index}_16"></p>
                        <p class="textbox" id="${theCount.index}_16t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_17a" >
                        <p class="titlebox" id="${theCount.index}_17"></p>
                        <p class="textbox" id="${theCount.index}_17t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_18a" >
                        <p class="titlebox" id="${theCount.index}_18"></p>
                        <p class="textbox" id="${theCount.index}_18t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_19a" >
                        <p class="titlebox" id="${theCount.index}_19"></p>
                        <p class="textbox" id="${theCount.index}_19t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_20a" >
                        <p class="titlebox" id="${theCount.index}_20"></p>
                        <p class="textbox" id="${theCount.index}_20t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                </div>
                
                <div class="row">
                    <a href="#" class="col-3" id="${theCount.index}_21a" >
                        <p class="titlebox" id="${theCount.index}_21"></p>
                        <p class="textbox" id="${theCount.index}_21t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_22a" >
                        <p class="titlebox" id="${theCount.index}_22"></p>
                        <p class="textbox" id="${theCount.index}_22t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_23a" >
                        <p class="titlebox" id="${theCount.index}_23"></p>
                        <p class="textbox" id="${theCount.index}_23t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_24a" >
                        <p class="titlebox" id="${theCount.index}_24"></p>
                        <p class="textbox" id="${theCount.index}_24t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_25a" >
                        <p class="titlebox" id="${theCount.index}_25"></p>
                        <p class="textbox" id="${theCount.index}_25t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                </div>
                
                <div class="row">
                    <a href="#" class="col-3" id="${theCount.index}_26a" >
                        <p class="titlebox" id="${theCount.index}_26"></p>
                        <p class="textbox" id="${theCount.index}_26t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_27a" >
                        <p class="titlebox" id="${theCount.index}_27"></p>
                        <p class="textbox" id="${theCount.index}_27t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_28a" >
                        <p class="titlebox" id="${theCount.index}_28"></p>
                        <p class="textbox" id="${theCount.index}_28t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_29a" >
                        <p class="titlebox" id="${theCount.index}_29"></p>
                        <p class="textbox" id="${theCount.index}_29t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                    <a href="#" class="col-3" id="${theCount.index}_30a" >
                        <p class="titlebox" id="${theCount.index}_30"></p>
                        <p class="textbox" id="${theCount.index}_30t">달성률: 00.0%<br><!-- 실적율: 00.0% --></p>
                    </a>
                </div>
                
            </div>
            <!-- 현황판 div01 end -->
            
            <!-- 현황판 div02 start -->
            <div style="float: left; width: 30%">
                <table class="sum_info">
                    <tbody>
                        <tr style="border-bottom: 10px solid #fff;">
                            <th class="sum_info_title">
                                <div class="round_div_title">
                                    <span style="font-size: 3.5em; font-weight: bold;"><br><br>가동중</span>
                                </div>
                            </th>
                            <td>
                                <div class="round_div01">
                                    <span id="${theCount.index}_operation" style="font-size: 20em; font-weight: bold;">00</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th class="sum_info_title">
                                <div class="round_div_title">
                                    <span style="font-size: 3em; font-weight: bold;"><br><br><br>정지/대기</span>
                                </div>
                            </th>
                            <td>
                                <div class="round_div02">
                                    <span id="${theCount.index}_stop" style="font-size: 20em; font-weight: bold;">00</span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 현황판 div02 end -->
        </div>
        
    </c:forEach>
</div>