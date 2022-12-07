<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-26
  Time: 오후 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <style>
        #footer{
            position: fixed;
            bottom: 0;
            width: 100%;
            height: 60px;
            background-color: white;
            z-index: 1000;
        }
        #footer ul {
            list-style: none;
        }
        #footer ul li {
            display: inline-block;
            padding: 0px 5px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container-fluid" id="footer">
        <div class="row">
            <hr class="mb-0">
        </div>
        <div class="row my-2"></div>
        <div class="row mt-0">
            <div class="col d-flex justify-content-center">
                <ul>
                    <li>담당자 : XXX</li>
                    <li>전화번호 : 010-XXXX-XXXX</li>
                    <li>제작 : 김준영</li>
                </ul>
            </div>
        </div>
    </div>
</body>

