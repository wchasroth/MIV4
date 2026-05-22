  function flipPanel(id, obj) {
           panel = document.getElementById(id);
           if (panel.style.display === "block")  panel.style.display = "none";
           else {
               allPanels = document.getElementsByClassName('panel');
               for (const eachPanel of allPanels)  eachPanel.style.display = "none";
               panel.style.display = "block";
           }
        }
