<%@ page pageEncoding="utf-8"%>

<div class="board_slide" style="width:100%; height: 100%;"><!--  border: 1px solid #48BAE4; -->
    <!-- dynamic line start -->
        <div style="width:100%; height: 100%;" align="center">
            <div style="width: 100%; text-align: left;">
                <span style="font-size: 3em; font-weight: bold;">&bull; 조립반 Line</span>
            </div>
            
            <div class="image_div_left" style="overflow-x: hidden; overflow-y: hidden; vertical-align: middle;">
                <img id="imgShow" style="padding: 2px 0 0 2px; width: 100%; height: 100%;" src="<c:url value="/images/item/5Y-3000_3830.jpg" />" alt="item_image">
            </div>
            
            <div class="col_10">
                <h3 style="font-size: 3em; text-align: left;">&nbsp;&nbsp;&nbsp; &bull; 조립반 작업현황</h3>
                <!-- 
                <h3>Cur</h3>
                <h3 id="test01"></h3>
                
                <h3>Res</h3>
                <h3 id="test02"></h3>
                -->
                <table class="tbl_01">
                    <tbody>
                        <!-- row 1 -->
                        <tr>
                            <th scope="row" class="width-em-825">작업지시번호</th>
                            <td>
                                <span id="WO_NO" style="font-weight: bold;"></span>
                            </td>
                        </tr>
                        <!-- row 2 -->
                        <!-- 
                        <tr>
                            <th scope="row">품번</th>
                            <td>
                                <span id="ITM_NM" style="font-weight: bold;">10000-00001</span>
                            </td>
                        </tr>
                        -->
                        <!-- row 3 -->
                        <tr>
                            <th scope="row">품명</th>
                            <td>
                                <span id="ITM_NM" style="font-weight: bold;"></span>
                            </td>
                        </tr>
                        <!-- row 4 -->
                        <tr>
                            <th scope="row">계획수량</th>
                            <td>
                                <span id="WO_QTY" style="font-weight: bold;"></span>
                            </td>
                        </tr>
                        <!-- row 5 -->
                        <tr>
                            <th scope="row">실적수량</th>
                            <td>
                                <span id="OK_OUT_QTY" style="font-weight: bold;"></span>
                            </td>
                        </tr>
                        <!-- row 6 -->
                        <tr>
                            <th>달성률</th>
                            <td>
                                <span id="ACH_RATE" style="font-weight: bold;">%</span>
                            </td>
                        </tr>
                        <!-- row 7 -->
                        <tr>
                            <th>
                                <span style="font-weight: bold;">Lot No</span>
                            </th>
                            <td>
                                <span id="MNG_NO" style="font-weight: bold;"></span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
        </div>
</div>
