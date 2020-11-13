package crud.dao;

import crud.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class CustomerDAOImp implements CustomerDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Customer> getCustomers() {

        Session currentSession = sessionFactory.getCurrentSession();
        Query<Customer> getCustomersQuery = currentSession.createQuery("from Customer order by lastName", Customer.class);
        List<Customer> customers = getCustomersQuery.getResultList();

        return customers;
    }

    @Override
    public void saveCustomer(Customer customer) {

        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(customer);

    }

    @Override
    public Customer getCustomer(int customerId) {

        Session currentSession = sessionFactory.getCurrentSession();
        Customer customer = currentSession.get(Customer.class, customerId);

        return customer;
    }

    @Override
    public void deleteCustomer(int customerId) {

        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery("delete from Customer where id=:customerId");
        query.setParameter("customerId", customerId);

        query.executeUpdate();
    }
}
