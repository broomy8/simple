package simple.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import simple.common.dao.AbstractDAO;

@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO
{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selecBoardList(Map<String, Object> map) throws Exception
	{
		return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selecBoardDetail(Map<String, Object> map) throws Exception
	{
		return (Map<String, Object>) selectOne("sample.selectBoardDetail", map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception
	{
		insert("sample.insertBoard", map);
	}
	
	public void updateBoard(Map<String, Object> map) throws Exception
	{
		update("sample.updateBoard", map);
	}

	public void updateHit(Map<String, Object> map) throws Exception
	{
		update("sample.updateHitCnt", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception
	{
		delete("sample.deleteBoard", map);
	}
}
