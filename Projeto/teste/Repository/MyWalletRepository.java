package com.gerenciador.eventos.Repository;

import com.gerenciador.eventos.Object.MyWallet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MyWalletRepository extends JpaRepository<MyWallet, Long> {
}
