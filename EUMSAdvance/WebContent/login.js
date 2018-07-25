document.getElementById("user").addEventListener("click",exptoright);
        function exptoright(){
            document.getElementById("leftdiv").style.transition ="width 1s ease-out 0s";
            document.getElementById("leftdiv").style.width = "100%";
            document.getElementById("rightdiv").style.transition ="left 1s ease-out 0s";
            document.getElementById("rightdiv").style.left = "100%";
            document.getElementById("user").style.left ="45%";
            document.getElementById("user").style.top ="15%";
            document.getElementById("user").style.transition = "all 1s ease-out 0s";
            document.getElementById("user").style.width = "150px";
            document.getElementById("user").style.height = "150px";
            document.getElementById("usr").style.left = "46.5%";
            document.getElementById("usr").style.top = "37%";
            document.getElementById("usr").style.transition = "all 1s ease-out 0s";
            document.getElementById("fmleft").style.transition = "opacity 2s 0.8s ease-in-out";
            document.getElementById("fmleft").style.opacity="1";
            document.getElementById("fmright").style.visibility="hidden";
            document.getElementById("backbl").style.transition = "opacity 2s 0.8s ease-in-out";
            document.getElementById("backbl").style.opacity="1";
        }

        document.getElementById("backbl").addEventListener("click",revexptoright);
        function revexptoright(){
            document.getElementById("leftdiv").style.transition ="width 1s ease-out 0s";
            document.getElementById("leftdiv").style.width = "50%";
            document.getElementById("rightdiv").style.transition ="left 1s ease-out 0s";
            document.getElementById("rightdiv").style.left = "50%";
            document.getElementById("user").style.left ="35%";
            document.getElementById("user").style.top ="25%";
            document.getElementById("user").style.transition = "all 1s ease-out 0s";
            document.getElementById("user").style.width = "200px";
            document.getElementById("user").style.height = "200px";
            document.getElementById("usr").style.left = "42%";
            document.getElementById("usr").style.top = "57%";
            document.getElementById("usr").style.transition = "all 1s ease-out 0s";
            document.getElementById("fmleft").style.transition = "opacity 0.2s 0s ease-in-out";
            document.getElementById("fmleft").style.opacity="0";
            document.getElementById("fmright").style.visibility="visible";
            document.getElementById("backbl").style.transition = "opacity 1s 0s ease-in-out";
            document.getElementById("backbl").style.opacity="0";
        }


        
        document.getElementById("admin").addEventListener("click",exptoleft);
        function exptoleft(){
            document.getElementById("rightdiv").style.transition ="all 1s ease-out 0s";
            document.getElementById("rightdiv").style.width = "100%";
            document.getElementById("rightdiv").style.left = "0%";
            document.getElementById("leftdiv").style.transition ="left 1s ease-out 0s";
            document.getElementById("leftdiv").style.left = "-50%";
            document.getElementById("admin").style.left ="44.5%";
            document.getElementById("admin").style.top ="15%";
            document.getElementById("admin").style.transition = "all 1s ease-out 0s";
            document.getElementById("admin").style.width = "150px";
            document.getElementById("admin").style.height = "150px";
            document.getElementById("adm").style.left = "49%";
            document.getElementById("adm").style.top = "36%";
            document.getElementById("adm").style.transition = "all 1s ease-out 0s";
            document.getElementById("fmright").style.transition = "opacity 2s 0.8s ease-in-out";
            document.getElementById("fmright").style.opacity="1";
            document.getElementById("backbr").style.transition = "opacity 2s 0.8s ease-in-out";
            document.getElementById("backbr").style.opacity="1";
            document.getElementById("backbl").style.opacity="0";

        }

        document.getElementById("backbr").addEventListener("click",revexptoleft);
        function revexptoleft(){
            document.getElementById("rightdiv").style.transition ="all 1s ease-out 0s";
            document.getElementById("rightdiv").style.width = "50%";
            document.getElementById("rightdiv").style.left = "50%";
            document.getElementById("leftdiv").style.transition ="left 1s ease-out 0s";
            document.getElementById("leftdiv").style.left = "0%";
            document.getElementById("admin").style.left ="35%";
            document.getElementById("admin").style.top ="25%";
            document.getElementById("admin").style.transition = "all 1s ease-out 0s";
            document.getElementById("admin").style.width = "200px";
            document.getElementById("admin").style.height = "200px";
            document.getElementById("adm").style.left = "47%";
            document.getElementById("adm").style.top = "57%";
            document.getElementById("adm").style.transition = "all 1s ease-out 0s";
            document.getElementById("fmright").style.transition = "opacity 0.2s 0s ease-in-out";
            document.getElementById("fmright").style.opacity="0";
            document.getElementById("backbr").style.transition = "opacity 1s 0s ease-in-out";
            document.getElementById("backbr").style.opacity="0";
            document.getElementById("backbl").style.opacity="0";

        }