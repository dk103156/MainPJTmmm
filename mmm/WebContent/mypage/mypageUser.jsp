<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<title>회원정보</title>

<style>

.container.has-lnb #contents {
    float: right;
    width: calc(100% - 260px);
}
#contents {
    width: 100%;
    margin: 0;
    padding: 0 0 0 0;
}
* {
    box-sizing: border-box;
}

div {
    display: block;
}

body {
    overflow: auto;
    overflow-y: scroll;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
    
}

* {
    box-sizing: border-box;
}

.my-magabox-info {
    overflow: hidden;
    height: 367px;
    border-radius: 10px;
    background-color: #f3f4f6;
}

.my-magabox-info .top {
    position: relative;
    height: 198px;
    padding: 30px 30px 0 0;
}

.my-magabox-info .top .photo {
    float: left;
    width: 200px;
    padding: 20px 0 0 60px;
}

.my-magabox-info .top .photo .wrap {
    position: relative;
    width: 93px;
    margin: 0;
    padding: 0 0 7px 0;
    background: url(https://img.megabox.co.kr/static/pc/images/mypage/bg-photo-back.png) no-repeat center bottom;
}

button, input {
    overflow: visible;
}

button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}

input[type="file" i] {
    -webkit-appearance: initial;
    background-color: initial;
    cursor: default;
    align-items: baseline;
    color: inherit;
    text-align: start !important;
    padding: initial;
    border: initial;
}

input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textfield;
    background-color: -internal-light-dark-color(white, black);
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 0px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}

button, input {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font-family: inherit;
    font-size: 1em;
    line-height: 1.15;
}

input[type="hidden" i] {
    display: none;
    -webkit-appearance: initial;
    background-color: initial;
    cursor: default;
    padding: initial;
    border: initial;
}

.my-magabox-info .top .photo .wrap i {
    overflow: hidden;
    display: block;
    position: absolute;
    right: 0;
    top: 10px;
    margin: 0;
    border-radius: 19px;
    box-shadow: -2px 2px 5px 0 rgba(45,45,45,.3);
}
.ico-add-photo {
    width: 19px;
    height: 19px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-add-photo.png);
}
.iconset {
    overflow: hidden;
    display: inline-block;
    margin: -1px 0 0 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    vertical-align: middle;
    background-position: 0 0;
    background-repeat: no-repeat;
}

i {
    font-style: italic;
}


.my-magabox-info .top .photo .wrap .img {
    overflow: hidden;
    display: block;
    width: 93px;
    height: 93px;
    border-radius: 93px;
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 0;
    line-height: 0;
    background-color: transparent;
    box-shadow: 0 5px 5px 0 rgba(45,45,45,.2);
}
[type=button], [type=reset], [type=submit], button {
    -webkit-appearance: button;
}

button, select {
    text-transform: none;
}

.my-magabox-info .top .photo .wrap .img img {
    width: 100%;
    height: 100%;
    border-radius: 93px;
}

img {
    border: 0;
}

.my-magabox-info .top .grade {
    float: left;
    padding-top: 20px;
}

.my-magabox-info .top .grade .name {
    font-size: 1.8666em;
    line-height: 1.3;
    color: #222;
}
.my-megabox-main p {
    margin: 0;
    padding: 0;
}

.my-magabox-info .top .grade .link {
    padding: 15px 0 0 0;
}

.my-magabox-info .top .grade .link a {
    margin-right: 10px;
    color: #666;
}
a:visited {
    color: #666;
    text-decoration: none;
    outline: 1px dotted #000;
}
a:link {
    color: #444;
    text-decoration: none;	
    
}
a {
    background-color: transparent;
}

.my-magabox-info .top .grade .link a i {
    margin-left: 2px;
}
.my-magabox-info .ico-arr-right-reverse {
    width: 6px;
    height: 9px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-arr-right-reverse-gray.png);
}
.iconset {
    overflow: hidden;
    display: inline-block;
    margin: -1px 0 0 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    vertical-align: middle;
    background-position: 0 0;
    background-repeat: no-repeat;
}

.ico-exclamation-white {
    width: 16px;
    height: 16px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-exclamation-white.png);
}

.my-magabox-info .top .special-membership {
    float: right;
    width: 206px;
    height: 131px;
    text-align: center;
    border: 1px solid #d8d9db;
    border-radius: 10px;
}

.my-magabox-info .top .special-membership .tit {
    height: 50px;
    line-height: 50px;
    text-transform: uppercase;
}
.my-megabox-main p {
    margin: 0;
    padding: 0;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.my-magabox-info .top .special-membership {
    float: right;
    width: 206px;
    height: 131px;
    text-align: center;
    border: 1px solid #d8d9db;
    border-radius: 10px;
}

.my-magabox-info .top .special-membership .no-join {
    padding: 0;
}

.my-magabox-info .top .special-membership .no-join .txt {
    padding: 0 0 10px 0;
    font-size: .9333em;
    line-height: 1.3;
}


.my-magabox-info .top .special-membership .no-join a {
    color: #444;
}

.my-magabox-info .bottom {
    overflow: hidden;
    height: calc(100% - 198px);
    padding: 26px 30px 29px 30px;
    background-color: #eaebed;
}

.my-magabox-info .bottom .point {
    float: left;
    width: 337px;
    min-height: 116px;
}

.my-magabox-info .bottom .point .tit-area {
    padding-right: 30px;
}
.my-magabox-info .bottom .tit-area {
    overflow: hidden;
}

.my-magabox-info .bottom .tit-area .tit {
    float: left;
    font-size: 1.2em;
    color: #222;
}
.my-megabox-main p {
    margin: 0;
    padding: 0;
}

.my-magabox-info .bottom .tit-area a {
    float: right;
    color: #444;
}

.ico-arr-right-gray {
    overflow: hidden;
    width: 7px;
    height: 12px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-arr-right-gray.png);
}

.my-magabox-info .bottom .point .cont-area .total {
    overflow: hidden;
}

.my-magabox-info .bottom .point .cont-area .total .now {
    overflow: hidden;
    display: block;
    float: left;
    width: 140px;
    height: 44px;
    line-height: 48px;
    color: #339eb2;
    font-weight: 400;
    font-size: 1.8em;
    vertical-align: middle;
    letter-spacing: -1px;
}

.my-magabox-info .bottom .point .cont-area .total .division {
    display: table;
    float: left;
}

.my-magabox-info .bottom .point .cont-area .total .division .cell {
    display: table-cell;
    height: 44px;
    padding: 0 0 0 36px;
    vertical-align: middle;
    background: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-equal-black.png) no-repeat 10px center;
}

.my-magabox-info .bottom .point .cont-area .total .division .cell p span {
    display: inline-block;
    width: 60px;
}

em {
    font-style: normal;
}

.my-magabox-info .bottom .point .cont-area .change {
    overflow: hidden;
    margin: 10px 30px 0 0;
    padding: 10px 0 0 0;
    border-top: 1px solid #d8d9db;
}

.my-magabox-info .bottom .point .cont-area .change .save {
    float: left;
}

.my-magabox-info .bottom .point .cont-area .change .save em {
    margin-left: 4px;
    color: #222;
}

.my-magabox-info .bottom .point .cont-area .change .del {
    float: left;
    position: relative;
    margin: 0 0 0 10px;
    padding: 0 0 0 11px;
}

.my-magabox-info .bottom .theater {
    float: left;
    width: 237px;
    height: 100%;
    min-height: 116px;
    padding: 0 30px;
    border-left: 1px solid #d8d9db;
}

.my-magabox-info .bottom .tit-area {
    overflow: hidden;
}

.my-magabox-info .bottom .tit-area .tit {
    float: left;
    font-size: 1.2em;
    color: #222;
}

.my-magabox-info .bottom .tit-area a {
    float: right;
    color: #444;
}

.my-magabox-info .ico-arr-right-reverse {
    width: 6px;
    height: 9px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-arr-right-reverse-gray.png);
}

.my-magabox-info .bottom .theater .no-list {
    padding-top: 9px;
}

.my-magabox-info .bottom .theater .no-list span {
    display: inline-block;
    border-bottom: 1px solid #444;
}

ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

l {
    display: block;
    list-style-type: decimal;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.my-magabox-info .bottom .theater .list ol li {
    padding: 9px 0 0 0;
    line-height: 1.1;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}

.my-magabox-info .bottom .theater .list ol li em {
    display: inline-block;
    margin: 0 5px 0 0;
    font-family: Roboto;
    font-style: italic;
    font-size: 1.2em;
    vertical-align: middle;
}

.my-magabox-info .bottom .coupon {
    float: left;
    width: 206px;
    height: 100%;
    padding: 0 0 0 30px;
    border-left: 1px solid #d8d9db;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

my-magabox-info .bottom .coupon .list ul li span {
    display: block;
    float: left;
}

.my-magabox-info .bottom .coupon .list ul li em {
    display: block;
    float: right;
    text-align: right;
}

.my-magabox-info .bottom .theater .list ol li {
    padding: 9px 0 0 0;
    line-height: 1.1;
}

li {
    text-align: -webkit-match-parent;
}


li {
    display: list-item;
    text-align: -webkit-match-parent;
}

ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

div {
    display: block;
}

.my-megabox-main .column {
    overflow: hidden;
}
.mt70 {
    margin-top: 70px!important;
}

.my-megabox-main .column .col.left {
    float: left;
}
.my-megabox-main .column .col {
    width: 400px;
}

.my-megabox-main .tit-util {
    padding-bottom: 15px;
}

.my-megabox-main .tit-util .tit {
    line-height: 32px;
}
h2.tit.small {
    padding: 0 0 16px 0;
    font-size: 1.4666em;
    color: #503396;
}
.tit-util .tit {
    float: left;
    padding: 0!important;
    line-height: 1.1;
}

.tit-util .right {
    float: right;
}

a.button.gray-line:active, a.button.gray-line:focus, a.button.gray-line:hover, a.button.gray-line:visited {
    color: #444;
}
.button.gray-line.small {
    line-height: 32px;
}
a.button:active, a.button:focus, a.button:hover, a.button:visited {
    color: #503396;
}
.tit-util .right a {
    display: inline-block;
}
.button.gray-line {
    color: #444;
    line-height: 36px;
    border: 1px solid #c1c1c1;
    background-color: #fff;
}
.button.small {
    height: 32px;
    padding: 0 12px;
    line-height: 30px;
    font-size: .9333em;
}
a.button {
    text-decoration: none;
}
a:visited {
    color: #666;
    text-decoration: none;
    outline: 1px dotted #000;
}
a:link {
    color: #444;
    text-decoration: none;
}
.button {
    display: inline-block;
    height: 36px;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #503396;
    font-weight: 400;
    border-radius: 4px;
    text-decoration: none;
    border: 1px solid #503396;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}


.button.gray-line.small {
    line-height: 32px;
}

.my-megabox-main .link-movie-story {
    overflow: hidden;
    height: 100px;
    padding: 20px 10px;
    text-align: center;
}
.box-border {
    padding: 20px;
    border: 1px solid #d8d9db;
    background-color: #fff;
    border-radius: 5px;
}

.my-megabox-main .link-movie-story a {
    display: block;
    float: left;
    width: calc(25% - 10px);
    height: 100%;
    margin: 0 5px;
    padding: 5px 5px 0 5px;
    line-height: 1.1;
    text-decoration: none;
}


.my-megabox-main .link-movie-story a em {
    display: block;
    font-family: Roboto;
    font-size: 2em;
    font-weight: 400;
    color: #01738b;
}

.my-megabox-main .link-movie-story a span {
    display: block;
    padding: 3px 0 0 0;
}

.my-megabox-main .column .col.right {
    float: right;
}
.my-megabox-main .column .col {
    width: 400px;
}

.tit-util:after, .tit-util:before {
    content: '';
    display: block;
}
.tit-util:after {
    clear: both;
}
.tit-util:after, .tit-util:before {
    content: '';
    display: block;
}

.my-megabox-main .tit-util {
    padding-bottom: 15px;
}

.my-megabox-main .tit-util .tit {
    line-height: 32px;
}
h2.tit.small {
    padding: 0 0 16px 0;
    font-size: 1.4666em;
    color: #503396;
}
.tit-util .tit {
    float: left;
    padding: 0!important;
    line-height: 1.1;
}
h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}
h1, h2, h3, h4, h5, h6 {
    margin: 0;
    padding: 0;
    font-weight: 400;
}

.tit-util .right {
    float: right;
}

.my-megabox-main .favor-see {
    overflow: hidden;
    height: 100px;
    padding-top: 30px;
}
.box-border {
    padding: 20px;
    border: 1px solid #d8d9db;
    background-color: #fff;
    border-radius: 5px;
}

.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}

.dot-list.gray>li:before {
    background-color: #aaa!important;
}
.dot-list>li:before {
    content: '';
    display: block;
    position: absolute;
    top: 9px;
    left: 0;
    background-color: #503396;
    width: 3px;
    height: 3px;
}

.mr10 {
    margin-right: 10px!important;
}
.font-gblue {
    color: #01738b!important;
}


.dot-list>li+li {
    margin-top: 2px;
}
.dot-list>li {
    position: relative;
    padding: 0 0 0 8px;
}


.my-megabox-main .tit-util .more {
    line-height: 32px;
}
.tit-util .more {
    float: right;
}

.my-megabox-main .tit-util .tit {
    line-height: 32px;
}

h2.tit.small {
    padding: 0 0 16px 0;
    font-size: 1.4666em;
    color: #503396;
}
.tit-util .tit {
    float: left;
    padding: 0!important;
    line-heig
}

.my-megabox-main .my-reserve-history {
    border-top: 1px solid #555;
}

.my-megabox-main .my-reserve-history ul li.no-result {
    min-height: 0;
    padding: 20px 0;
}
.my-megabox-main .my-reserve-history ul li {
    position: relative;
    min-height: 140px;
    margin: 0;
    padding: 20px 100px 20px 100px;
    border-bottom: 1px solid #eaeaea;
}

.my-megabox-main .my-reserve-history ul li.no-result .no-history-reservation {
    border: none;
}

.no-history-reservation {
    display: block;
    height: 160px;
    padding: 0;
    text-align: center;
    line-height: 160px;
    border: 1px solid #ddd;
    border-width: 1px 0;
}


.table-wrap {
    position: relative;
    border-top: 1px solid #555;
}

.board-list {
    line-height: 1.3;
}
table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
}

table caption {
    overflow: hidden;
    width: 0;
    height: 0;
    font-size: 0;
    line-height: 0;
    opacity: 0;
}

caption {
    display: table-caption;
    text-align: -webkit-center;
}

colgroup {
    display: table-column-group;
}
.board-list {
    line-height: 1.3;
}


col {
    display: table-column;
}

.board-list {
    line-height: 1.3;
}


tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.board-list.line>tbody>tr>td:last-child, .board-list.line>tbody>tr>th:last-child {
    border-width: 0 0 1px 0;
}
.board-list.line>tbody>tr>td, .board-list.line>tbody>tr>th {
    border-width: 0 1px 1px 0;
}
.board-list>tbody>tr>td, .board-list>tbody>tr>th {
    height: 45px;
    padding: 10px;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    text-align: center;
}
.a-c {
    text-align: center!important;
}
table td, table th {
    padding: 0;
}

td {
    display: table-cell;
    vertical-align: inherit;
}

.my-megabox-main .column .col.left {
    float: left;
}
.my-megabox-main .column .col {
    width: 400px;
}

.my-megabox-main .brd-list {
    overflow: hidden;
    border-top: 1px solid #555;
    border-bottom: 1px solid #eaeaea;
}

.my-megabox-main .brd-list ul li.no-result {
    padding: 20px 0 0 0;
    text-align: center;
}
.my-megabox-main .brd-list ul li {
    position: relative;
    height: 63px;
    padding: 0 90px 0 0;
}

.my-megabox-main .column .col.right {
    float: right;
}
.my-megabox-main .column .col {
    width: 400px;
}


.board-list.line>tbody>tr>td:last-child, .board-list.line>tbody>tr>th:last-child {
    border-width: 0 0 1px 0;
}
.board-list.line>tbody>tr>td, .board-list.line>tbody>tr>th {
    border-width: 0 1px 1px 0;
}
.board-list>tbody>tr>td, .board-list>tbody>tr>th {
    height: 45px;
    padding: 10px;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    text-align: center;
}
.a-c {
    text-align: center!important;
}
table td, table th {
    padding: 0;
}  
    

.board-list {
    line-height: 1.3;
}
table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
}
* {
    box-sizing: border-box;
}

table {
    display: table;
    border-collapse: separate;
    border-spacing: 2px;
    border-color: grey;
}

colgroup {
    display: table-column-group;
}


</style>
</head>
<body>


<div id="contents">

	<!-- my-megabox-main -->
	<div class="my-megabox-main">

		<div class="my-magabox-info ">
			<!-- top -->
			<div class="top">
				<div class="photo" id="myPhoto">
					<div class="wrap">
						<form name="fileForm" style="display: none;">
							<input type="file"   name="file">
							<input type="hidden" name="fileMbNo" value="72436" />
						</form>

						<i class="iconset ico-add-photo"></i>

						<button type="button" class="img">
							<img src="https://www.megabox.co.kr/static/pc/images/mypage/bg-photo.png" alt="" onerror="noImg(this, 'human')" />
						</button>
					</div>
				</div>

				<div class="grade">
					<p class="name">
					
					님은 일반등급 입니다.<br>
					
					</p>	 	
					<div class="link">
						<a href="/mypage/myinfo?returnURL=info" title="개인정보수정 페이지로 이동">개인정보수정 <i class="iconset ico-arr-right-reverse"></i></a>
						<a href="#layer_before_grade" id="bfrClassSearch" class="btn-modal-open" w-data="400" h-data="400" title="지난등급 상세보기">
							지난등급조회 <i class="iconset ico-arr-right-reverse"></i>
						</a>
					</div>
				</div>

			</div>
			<!--// top -->

			<!-- bottom -->
			<div class="bottom">
				<div class="point" id="myPoint">
					<div class="tit-area">
						<p class="tit">총 보유 포인트</p>
						<a href="/mypage/point-list" class="more" title="포인트 이용내역 페이지로 이동"><i class="iconset ico-arr-right-gray">더보기</i></a>
					</div>

					<div class="cont-area">
						<div class="total">
							<p class="now">0 P</p>

							<div class="division" style="display: none;">
								<div class="cell">
									<p class="old">
										<span>구 포인트</span>
										<em>0</em>
									</p>

									<p class="new">
										<span>신 포인트</span>
										<em>0</em>
									</p>
								</div>
							</div>
						</div>

						<div class="change">
							<p class="save">
								<span>적립예정</span>
								<em>0 P</em>
							</p>

							<div class="del">
								<span>소멸예정</span>
								<em>0 P</em>
							</div>
						</div>
					</div>
				</div>

				<!-- theater -->
				<div class="theater" id="myFaverBrch">
					<div class="tit-area">
						<p class="tit">선호극장</p>
						<a href="" class="right" title="선호극장 변경">변경 <i class="iconset ico-arr-right-reverse"></i></a>
					</div>

					<div class="list">
						<div class="no-list" style="display: none;">
							<span>선호극장</span>을  설정하세요.
						</div>
						<ol></ol>
					</div>
				</div>
				<!--// theater -->

				<!-- coupon -->
				<div class="coupon" id="myCoupon">
					<div class="tit-area">
						<p class="tit">관람권/쿠폰</p>

						<a href="/mypage/movie-coupon" class="more"><i class="iconset ico-arr-right-gray" title="영화관람권 페이지로 이동">더보기</i></a>
					</div>

					<div class="list">
						<ul>
							<li>
								<span>영화관람권</span>
								<em>0 매</em>
							</li>
							<li>
								<span>스토어교환권</span>
								<em>0 매</em>
							</li>
							<li>
								<span>할인/제휴쿠폰</span>
								<em>0 매</em>
							</li>
						</ul>
					</div>
				</div>
				<!--// coupon -->
			</div>
			<!--// bottom -->
		</div>
		<!--// my-magabox-info -->

		
		<!-- column -->
		<div class="column mt70">
			<!-- left -->
			<div class="col left" id="myStory">
				<div class="tit-util">
					<h2 class="tit small">나의 무비스토리</h2>

					<div class="right">
						<a href="#saw_movie_regi" class="button gray-line small btn-modal-open" w-data='600' h-data='400' title="본 영화 등록">본 영화 등록</a>
					</div>
				</div>

				<div class="box-border link-movie-story">
					<a href="/mypage/moviestory?cd=sm" title="본 영화 탭으로 이동">
						<em>0</em>
						<span>본 영화</span>
					</a>

					<a href="/mypage/moviestory?cd=one" title="한줄평 탭으로 이동">
						<em>0</em>
						<span>보고싶어</span>
					</a>

					<a href="/mypage/moviestory?cd=lm" title="보고싶어 탭으로 이동">
						<em>0</em>
						<span>한줄평</span>
					</a>

					<a href="/mypage/moviestory?cd=mp" title="무비포스트 탭으로 이동">
						<em>0</em>
						<span>리뷰</span>
					</a>
				</div>
			</div>
			<!--// left -->

			<!-- right -->
			<div class="col right" id="myFaverInfo">
				<div class="tit-util">
					<h2 class="tit small">선호관람정보</h2>

					<div class="right">
						<a href="" class="button gray-line small" title="설정">설정</a>
					</div>
				</div>

				<div class="box-border favor-see">
					<ul class="dot-list gray">
						<li><span class="font-gblue mr10">내 선호장르</span></li>
						<li><span class="font-gblue mr10">내 선호시간</span></li>
					</ul>
				</div>
			</div>
			<!--// right -->
		</div>
		<!--// column -->

		<div id="myBokd">
			<div class="tit-util mt70">
				<h2 class="tit small">나의 예매내역</h2>

				<a href="/mypage/bookinglist?tab=01" class="more" title="나의 예매내역 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
			</div>

			<!-- my-reserve-history -->
			<div class="my-reserve-history">
				<ul>
					<li class="no-result">
						<div class="no-history-reservation">
							예매 내역이 없습니다.
						</div>
					</li>
				</ul>
			</div>
			<!--// my-reserve-history -->
		</div>

		<div id="myPurc">
			<div class="tit-util mt70">
				<h2 class="tit small">나의 구매내역</h2>

				<a href="/mypage/bookinglist?tab=02" class="more" title="나의 구매내역 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
			</div>

			<div class="table-wrap">
				<table class="board-list line">
					<caption>나의 구매내역 요약 표</caption>
					<colgroup>
						<col style="width:160px;">
						<col style="width:140px;">
						<col>
						<col style="width:120px;">
						<col style="width:80px;">
					</colgroup>
					<tbody>
						<tr>
						<td colspan="6" class="a-c">구매 내역이 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<!-- column -->
		<div class="column mt70">
			<!-- left -->
			<div class="col left" id="mySbsc">
				<div class="tit-util">
					<h2 class="tit small">참여이벤트</h2>
					<a href="/mypage/myevent" class="more" title="참여이벤트 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
				</div>

				<div class="brd-list">
					<ul>
						<li class="no-result">
							참여한 이벤트가 없습니다.
						</li>
					</ul>
				</div>
			</div>
			<!--// left -->

			<!-- right -->
			<div class="col right" id="myInq">
				<div class="tit-util">
					<h2 class="tit small">문의내역</h2>

					<a href="/mypage/myinquiry?tab=" class="more" title="문의내역 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
				</div>

				<div class="brd-list">
					<ul>
						<li class="no-result">
							문의내역이 없습니다.
						</li>
					</ul>
				</div>
			</div>
			<!--// right -->
		</div>
		<!--// column -->
	</div>
	<!--// mypage-main -->
</div>


</body>
</html>