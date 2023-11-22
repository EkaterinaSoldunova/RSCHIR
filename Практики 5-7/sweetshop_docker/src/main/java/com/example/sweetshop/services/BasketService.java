package com.example.sweetshop.services;

import com.example.sweetshop.entities.Basket;
import com.example.sweetshop.entities.Cake;
import com.example.sweetshop.repositories.BasketRepository;
import com.example.sweetshop.repositories.CakeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Service
@Slf4j
@RequiredArgsConstructor
public class BasketService {
    private final BasketRepository basketRepository;
    private final CakeRepository cakeRepository;

    public List<Basket> listBasket() {
        return basketRepository.findAll();
    }

    public void addCakeToBasket(Basket basket) {
        basketRepository.save(basket);
    }

    public void deleteCakeFromBasket(Long id) {
        basketRepository.deleteById(id);
    }
    public void deleteAllFromBasket() {
        List<Basket> basketCakes = basketRepository.findAll();
        for (Basket b : basketCakes){
            Cake cake = cakeRepository.findById(b.getCakeId()).orElseThrow();
            cake.setBeing(cake.getBeing()-1);
        }
        basketRepository.deleteAll();
    }
}
