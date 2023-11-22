package com.example.sweetshop.controllers;

import com.example.sweetshop.entities.Basket;
import com.example.sweetshop.services.BasketService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class BasketController {
    private final BasketService basketService;

    @GetMapping("/basket")
    public String basket(Model model){
        model.addAttribute("basket", basketService.listBasket());
        return "basket";
    }

    @PostMapping("/basket/add")
    public String addToBasket(@RequestParam(value = "cakeId") long cakeId, @RequestParam(value = "cakeName") String cakeName, @RequestParam(value = "cakePrice") String cakePrice, @RequestParam(value = "cakeBeing") int cakeBeing) {
        if (cakeBeing == 0) {
            return "redirect:/";
        }
        else {
            Basket basket = new Basket();
            basket.setCakeId(cakeId);
            basket.setCakeName(cakeName);
            basket.setCakePrice(Integer.parseInt(cakePrice));
            basketService.addCakeToBasket(basket);
            return "redirect:/";
        }
    }

    @PostMapping("/basket/delete/{id}")
    public String deleteFromBasket(@PathVariable Long id) {
        basketService.deleteCakeFromBasket(id);
        return "redirect:/basket";
    }

    @PostMapping("/basket/deleteAll")
    public String deleteAllFromBasket() {
        basketService.deleteAllFromBasket();
        return "redirect:/basket";
    }
}
