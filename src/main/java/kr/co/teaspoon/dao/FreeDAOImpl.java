package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Free;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class FreeDAOImpl implements FreeDAO{

    @Autowired
    private SqlSession sqlSession;


    @Override
    public List<Free> freeList() throws Exception {
        return sqlSession.selectList("free.freeList");
    }

    @Override
    public Free freeDetail(int bno) throws Exception {
        sqlSession.update("free.countUp", bno);
        return sqlSession.selectOne("free.freeDetail", bno);
    }

    @Override
    public void freeInsert(Free dto) throws Exception {
        sqlSession.insert("free.freeInsert", dto);
    }

    @Override
    public void freeDelete(int bno) throws Exception {
        sqlSession.delete("free.freeDelete", bno);
    }

    @Override
    public void freeEdit(Free dto) throws Exception {
        sqlSession.update("free.freeEdit", dto);

    }
}
