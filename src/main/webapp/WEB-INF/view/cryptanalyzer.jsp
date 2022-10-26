<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ taglib prefix="seсurity" uri="http://www.springframework.org/security/tags" %>
<style>
    <%@include file="/WEB-INF/styles/styles.css" %>
</style>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cryptanalyzer page</title>

</head>
<body>
<header>
    <h2>Cryptanalyzer</h2>
</header>
<div id="tablecont">
    <div>
        <nav>
            <br>
            <%--            <form>--%>
            <%--                <input type="button" value="Encryption" onclick="window.location.href='/encrypt'">--%>
            <%--                <br><br>--%>
            <%--                <input type="button" value="Decryption with key" onclick="window.location.href='/decryption_with_key'">--%>
            <%--                <br><br>--%>
            <%--                <input type="button" value="Manual decryption Brute Force method's"--%>
            <%--                       onclick="window.location.href='/manual_decryption_brute_force'">--%>
            <%--                <br><br>--%>
            <%--                <input type="button" value="Auto Decryption Brute Force method's"--%>
            <%--                       onclick="window.location.href='/auto_decryption_brute_force'">--%>
            <%--                <br><br>--%>
            <%--                <input type="button" value="Manual decryption with statistic analise"--%>
            <%--                       onclick="window.location.href='/manual_decryption_statistic_analise'">--%>
            <%--                <br><br>--%>
            <%--                <input type="button" value="Auto decryption with statistic analise"--%>
            <%--                       onclick="window.location.href='/auto_decryption_statistic_analise'">--%>
            <%--                <br><br>--%>
            <%--            </form>--%>
            <br>

            <div class="button_crypto">
<%--                <seсurity:authorize access="hasRole('HR')">--%>
                <a href="/encrypt">Encryption</a>
<%--                <seсurity:authorize/>--%>
            </div>
            <br>
            <div class="button_crypto"><a href="/decryption_with_key">Decryption with key</a></div>
            <br>
            <div class="button_crypto"><a href="/manual_decryption_brute_force">Manual decryption brute force
                method's</a></div>
            <br>
            <div class="button_crypto"><a href="/auto_decryption_brute_force">Auto decryption brute force method's</a>
            </div>
            <br>
            <div class="button_crypto"><a href="/manual_decryption_statistic_analise">Manual decryption statistic
                analise method's</a></div>
            <br>
            <div class="button_crypto"><a href="/auto_decryption_statistic_analise">Auto decryption statistic
                analise method's</a></div>
            <br>
        </nav>
        <main>

            <div class="main_margin">


                <%
                    String form = (String) request.getAttribute("getForm");
                    String string = (String) request.getAttribute("encrypt");
                    if (string != null) {
                        out.println("<br><p><strong>Result:</strong></p> " + string);
                    } else if (form != null) {
                        switch (form) {
                            case "encrypt_form":
                %>
                    <%--                можно попробовать {/encrypt} - ({form}) вместо /encrypt и тогда количество форм можно будет сократить--%>
                <form action="/encrypt" method="post" enctype="multipart/form-data">
                    <p>Upload file
                        <input type="file" name="file" accept=".txt"></p>
                    <p><label for="key">Input key</label>
                        <input type="text" name="key" id="key" required></p>
                    <p><input type="submit" name="button" value="Encrypt"></p>
                </form>
                <%
                        break;
                    case "decryption_with_key":
                %>
                <form action="/decryption_with_key" method="post" enctype="multipart/form-data">
                    <p>Upload file
                        <input type="file" name="file" accept=".txt"></p>
                    <p><label for="key">Input key</label>
                            <%--                        здесь key2? --%>
                        <input type="text" name="key" id="key2" required></p>
                    <p><input type="submit" name="button" value="Encrypt"></p>
                </form>
                <%
                        break;
                    case "manual_decryption_brute_force":
                %>
                <form action="/manual_decryption_brute_force" method="post" enctype="multipart/form-data">
                    <p>Upload file
                        <input type="file" name="file" accept=".txt"></p>
                    <p><input type="submit" name="button" value="Encrypt"></p>
                </form>
                <%
                        break;
                    case "manual_decryption_statistic_analise":
                %>
                <form action="/manual_decryption_statistic_analise" method="post" enctype="multipart/form-data">
                    <p>Upload file
                        <input type="file" name="file" accept=".txt"></p>
                        <%--                    здесь вместо encrypt - decrypt? --%>
                    <p><input type="submit" name="button" value="Encrypt"></p>
                </form>
                <%
                        break;
                    case "auto_decryption_brute_force":
                %>
                <form action="/auto_decryption_brute_force" method="post" enctype="multipart/form-data">
                    <p>Upload file
                        <input type="file" name="file" accept=".txt"></p>
                    <p><input type="submit" name="button" value="Encrypt"></p>
                </form>
                <%
                        break;
                    case "auto_decryption_statistic_analise":
                %>
                <form action="/auto_decryption_statistic_analise" method="post" enctype="multipart/form-data">
                    <p>Upload file
                        <input type="file" name="file" accept=".txt"></p>
                    <p><input type="submit" name="button" value="Encrypt"></p>
                </form>


                <%
                    }
                } else {
                %>

                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkk3IAJvB7sjEEOv1vpBgDzdk6p84jzmCbyg&usqp=CAU"
                     class="img-fluid" alt="image">

                <br><br>

                <p>Description program:</p>
                <p>The program encodes and decodes text Caesar's cipher.</p>
                <p>At the beginning program's work user must choose the language.</p>
                <p>User indicate two path for each mode program's working (where from take text and where to save).</p>

                <br><br>

                <h3>The program had six modes of using.<br>Description:</h3>

                    <%--            <div class="accordion accordion-flush" id="accordionFlushExample">--%>
                    <%--                <div class="accordion-item">--%>
                    <%--                    <h2 class="accordion-header" id="flush-headingOne">--%>
                    <%--                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"--%>
                    <%--                                data-bs-target="#flush-collapseOne" aria-expanded="false"--%>
                    <%--                                aria-controls="flush-collapseOne">--%>
                    <%--                            <strong>Encryption</strong>--%>
                    <%--                        </button>--%>
                    <%--                    </h2>--%>
                    <%--                    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"--%>
                    <%--                         data-bs-parent="#accordionFlushExample">--%>
                    <%--                        <div class="accordion-body"><em>Text from first indicated file is encoding to second file.</em>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <%--                </div>--%>
                    <%--                <div class="accordion-item">--%>
                    <%--                    <h2 class="accordion-header" id="flush-headingTwo">--%>
                    <%--                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"--%>
                    <%--                                data-bs-target="#flush-collapseTwo" aria-expanded="false"--%>
                    <%--                                aria-controls="flush-collapseTwo">--%>
                    <%--                            <strong>Decryption with key</strong>--%>
                    <%--                        </button>--%>
                    <%--                    </h2>--%>
                    <%--                    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo"--%>
                    <%--                         data-bs-parent="#accordionFlushExample">--%>
                    <%--                        <div class="accordion-body"><em>The program will request the key for decryption.</em></div>--%>
                    <%--                    </div>--%>
                    <%--                </div>--%>
                    <%--                <div class="accordion-item">--%>
                    <%--                    <h2 class="accordion-header" id="flush-headingThree">--%>
                    <%--                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"--%>
                    <%--                                data-bs-target="#flush-collapseThree" aria-expanded="false"--%>
                    <%--                                aria-controls="flush-collapseThree">--%>
                    <%--                            <strong>Manual decryption "Brute Force" method's</strong>--%>
                    <%--                        </button>--%>
                    <%--                    </h2>--%>
                    <%--                    <div id="flush-collapseThree" class="accordion-collapse collapse"--%>
                    <%--                         aria-labelledby="flush-headingThree"--%>
                    <%--                         data-bs-parent="#accordionFlushExample">--%>
                    <%--                        <div class="accordion-body"><em>Decryption will make to indicated directory.--%>
                    <%--                            Amount of files depends from amount of language's letters (possible keys).</em></div>--%>
                    <%--                    </div>--%>
                    <%--                </div>--%>
                    <%--                <div class="accordion-item">--%>
                    <%--                    <h2 class="accordion-header" id="flush-headingFour">--%>
                    <%--                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"--%>
                    <%--                                data-bs-target="#flush-collapseFour" aria-expanded="false"--%>
                    <%--                                aria-controls="flush-collapseFour">--%>
                    <%--                            <strong>Auto Decryption "Brute Force" method's</strong>--%>
                    <%--                        </button>--%>
                    <%--                    </h2>--%>
                    <%--                    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour"--%>
                    <%--                         data-bs-parent="#accordionFlushExample">--%>
                    <%--                        <div class="accordion-body"><em>Program will use all possible keys in order.--%>
                    <%--                            Each of decrypted text will automatically verify to correct decryption,--%>
                    <%--                            using most frequently words of language. Decryption will make to indicate file.</em></div>--%>
                    <%--                    </div>--%>
                    <%--                </div>--%>
                    <%--                <div class="accordion-item">--%>
                    <%--                    <h2 class="accordion-header" id="flush-headingFive">--%>
                    <%--                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"--%>
                    <%--                                data-bs-target="#flush-collapseFive" aria-expanded="false"--%>
                    <%--                                aria-controls="flush-collapseFive">--%>
                    <%--                            <strong>Manual decryption with statistic</strong>--%>
                    <%--                        </button>--%>
                    <%--                    </h2>--%>
                    <%--                    <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive"--%>
                    <%--                         data-bs-parent="#accordionFlushExample">--%>
                    <%--                        <div class="accordion-body"><em>The program gets most frequent letter of encrypted text and took--%>
                    <%--                            it for--%>
                    <%--                            six the--%>
                    <%--                            greatest frequent letters of alphabets in order. The key is difference between letter's--%>
                    <%--                            indexes.--%>
                    <%--                            Decryption will make to indicate directory into different files.</em></div>--%>
                    <%--                    </div>--%>
                    <%--                </div>--%>
                    <%--                <div class="accordion-item">--%>
                    <%--                    <h2 class="accordion-header" id="flush-headingSix">--%>
                    <%--                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"--%>
                    <%--                                data-bs-target="#flush-collapseSix" aria-expanded="false"--%>
                    <%--                                aria-controls="flush-collapseSix">--%>
                    <%--                            <strong>Auto decryption with statistic</strong>--%>
                    <%--                        </button>--%>
                    <%--                    </h2>--%>
                    <%--                    <div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix"--%>
                    <%--                         data-bs-parent="#accordionFlushExample">--%>
                    <%--                        <div class="accordion-body"><em>The program works like previous function,--%>
                    <%--                            but decryption will make to indicate file after automatically verify to correct decryption,--%>
                    <%--                            using most frequently words of language.</em></div>--%>
                    <%--                    </div>--%>
                    <%--                </div>--%>
                    <%--            </div>--%>

                <br><br>
                <%
                    }
                %>
            </div>
        </main>
    </div>
</div>
</body>
<footer>
    <br>
    <p>Here is footer</p>
    <br>
</footer>
</html>