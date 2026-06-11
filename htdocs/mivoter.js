function flipPanel(id) {
   panel     = document.getElementById(id);
   allPanels = document.getElementsByClassName('panel');
   for (const eachPanel of allPanels)  {
      if (eachPanel != panel) eachPanel.classList.remove('show');
   }
   panel.classList.toggle('show');
}
