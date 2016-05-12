package repositories;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import domain.Runner;

@Repository
public interface RunnerRepository extends JpaRepository<Runner, Integer> {
	
	@Query("select r from Runner r where r.userAccount.id = ?1")
	Runner findByUserAccountId(int userAccountId);
	
}
