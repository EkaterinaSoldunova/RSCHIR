package com.example.sweetshop.repositories;

import com.example.sweetshop.entities.Basket;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BasketRepository extends JpaRepository<Basket, Long> {
}
