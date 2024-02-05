/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const btn=document.querySelector('.bar');
const btnIcon=document.querySelector('.bar i');
const btnmenu=document.querySelector('.dropdown');
btn.onclick=function(){
    btnmenu.classList.toggle('open');
    const isOpen=btnmenu.classList.contains('open');
    btnIcon.classList=isOpen?'fa-solid fa-xmark':'fa-solid fa-bars';
};

