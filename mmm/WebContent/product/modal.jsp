<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: 0;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
        }



        body {
            font-size: 16px;
            color: #333;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }
        div.wrap {
            height: 100vh;
            width: 100%;
            position: relative;
        }
        div.modal {
        
            width: 100%;
            position: fixed;
            bottom: -280px;
            left: 50%;
            transform: translateX(-50%);
            transition: all 0.3s;
        }
        div.modal.on {
            bottom: 0;
        }
        div.modalHeader {
            
        }
        div.closeModal {
            
        }
        div.closeModal a {
            background: #fcc4c2;
            display: block;
            width: 150px;
            border-radius: 5px 5px 0 0;
            text-align: center;
            
            margin: 0 auto;
            
        }
        div.closeModal a i {
            
        }
        div.modalMain {
            
            
            padding: 2px;
            background: #fcc4c2;
            height: 260px;
        }
        
    </style>
    <script>
        $(document).ready(function() {
            $(document).on('click', 'a[href="#"]', function(e) {
                e.preventDefault();
            });

            $('#button').on('click', function() {
                $('div.modal').toggleClass('on');
            });

        });
    </script>
</head>

<body>
    <div class="wrap">
       <button type="button" id="button" >modal</button>
        <div class="modal">
            <div class="modalHeader">
                <div class="closeModal">
                    <a href="#">
                        <i class="fas fa-angle-double-down"></i>
                    </a>
                </div>
            </div>
            <div class="modalMain">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque quia sapiente voluptas distinctio quae, incidunt possimus magni, consectetur, nostrum explicabo aliquid recusandae. Officia itaque dolorum, culpa laboriosam nihil ullam. Dicta.
            </div>
            
        </div>
    </div>
</body></html>