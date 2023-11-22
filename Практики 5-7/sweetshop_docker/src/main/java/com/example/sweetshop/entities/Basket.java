package com.example.sweetshop.entities;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "basket")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Basket {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "cakeId")
    private Long cakeId;
    @Column(name = "cakeName")
    private String cakeName;
    @Column(name = "cakePrice")
    private int cakePrice;
}
