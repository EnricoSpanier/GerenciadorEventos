package com.gerenciador.eventos.Service;

import com.gerenciador.eventos.Object.MyWallet;
import com.gerenciador.eventos.Repository.MyWalletRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyWalletService {
    @Autowired
    private MyWalletRepository myWalletRepository;

    public MyWallet getByUserId(Long userId) {
        return myWalletRepository.findById(userId).orElseThrow(() -> new RuntimeException("Carteira não encontrada"));
    }
}
