package com;
import static org.junit.Assert.assertTrue;

import com.entity.Product;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.apache.solr.common.StringUtils;
import org.junit.Test;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class ProTest  {


    /*@Test
    public void simpleQuery() throws IOException, SolrServerException {
        //1、获取链接
        String solrUrl = "http://localhost:8080/solr/demo_core";
        HttpSolrClient client = new HttpSolrClient.Builder(solrUrl).build();
        //2、创建
        SolrQuery queryparams = new SolrQuery("*:*");
        QueryResponse queryResponse = client.query(queryparams);
        List<Product> productList = queryResponse.getBeans(Product.class);
        System.out.println("---------"+productList.size());
        for (Product p:productList){
            System.out.println(p);
        }
        //4、提交对象
        client.commit();
        //5、关闭资源
        client.close();
System.out.println("查询结束");

    }

    @Test
    public void add() throws IOException, SolrServerException {
        String solrurl="http://localhost:8080/solr/demo_core";
        HttpSolrClient client=new HttpSolrClient.Builder(solrurl).build();
        Product p=new Product();
       *//* p.setProId(25l);*//*
        p.setId("25");
        p.setProName("solr测试");
        p.setProPrice(25d);
        p.setProDecrition("试试在干啥");
        p.setProNum(25);
        UpdateResponse  response=client.addBean(p);
        client.commit();
        client.close();
        System.out.println("successs");
    }
    @Test
    public void del() throws IOException, SolrServerException {
        String solrurl="http://localhost:8080/solr/demo_core";
        HttpSolrClient client=new HttpSolrClient.Builder(solrurl).build();
       client.deleteById("25");
        client.commit();
        client.close();
        System.out.println(" del successs");
    }

    @Test
    public void Comple() throws IOException, SolrServerException {
        String solrurl="http://localhost:8080/solr/demo_core";
        HttpSolrClient client=new HttpSolrClient.Builder(solrurl).build();
        SolrQuery query=new SolrQuery();
        String keyword="手办" ;//手办
        //设置q的查询方式
        if(StringUtils.isEmpty(keyword)){
            query.set("q","*"); //query.set("q","*:*");
        }else{
            query.set("q",keyword); //query.set("q","pro_name1:"+keyword);
        }
        //2设置fq
        //2.1按照描述模糊查询
        String cataname="";
        if(!StringUtils.isEmpty(cataname)){
             query.addFilterQuery("pro_decrition1:"+cataname);
        }
        //2.2按照价格查询
        String str_price="1-400";
        if(!StringUtils.isEmpty(str_price)){
            String []arra=str_price.split("-");
            if(arra.length==1){
                query.addFilterQuery("pro_price1:["+ arra[0]+" TO  * ]");
            }else{
                String prefix=arra[0];
                if(StringUtils.isEmpty(arra[0])){
                    prefix="*";
                }
                query.addFilterQuery("pro_price1:["+ prefix+" TO "+arra[1]+"]");
            }

        }
        //3.设置sort价格排序
         //
        int porst=0;
        if(porst==1) {
            query.addSort("pro_price1", SolrQuery.ORDER.desc);
        }else if(porst==2){
            query.addSort("pro_price1", SolrQuery.ORDER.asc);
        }
      //4分页
        *//*
        * start offset偏移量
        * rows rows返回的最大记录数
        *
        * start=rows*(page-1)
        * *//*
        query.setStart(0);
        query.setRows(5);

        //5设置回显  保护隐私数据
        query.setFields("id,pro_decrition1,pro_name1,pro_price1");
        //6.设置默认域
         query.set("df","pro_name1");

        //7设置高亮
        query.setHighlight(true);//启动高度设置
        query.addHighlightField("pro_name1");//设置高亮的域名
         query.setHighlightSimplePre("<font color='red'>");
         query.setHighlightSimplePost("</font>");

         QueryResponse queryResponse=client.query(query);

        //8得到高亮数据
      Map<String,Map<String,List<String>>> map = queryResponse.getHighlighting();

        List<Product> productList = queryResponse.getBeans(Product.class);
        System.out.println("-------集合的--"+productList.size());
        for (Product p:productList){

            Map<String,List<String>> map1=map.get(p.getId()+"");
           List<String> map2=map1.get("pro_name1");
            System.out.println(map2.get(0)+"name"+p.getId()+"id"+p.getProName()+"的价格："+p.getProPrice()+"===== 描述="+p.getProDecrition());
        }
    }

@Test
    public  void t1(){
        String str="0-";
        String [] arr=str.split("-");
        System.out.println("aaa==="+ Arrays.toString(arr));
}

*/
}
