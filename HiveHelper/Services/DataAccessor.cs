﻿using HiveHelper.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Dapper;

namespace HiveHelper.Services
{
    public class DataAccessor : IDataAccessor
    {
        IDbConnection db;
        public DataAccessor(IConfiguration config)
        {
            db = new SqlConnection(config.GetConnectionString("DbServer"));
        }

        public bool AddActionDetails(ActionDetail action)
        {
            //int result = db.Execute("AddActionDetail", new { hiveid = action.hive_id, completedbyid = action.completed_by_id, enteredbyid = action.entered_by_id, primaryactionid = action.primary_action_id, secondaryactionid = action.secondary_action_id, tertiaryactionid = action.tertiary_action_id, completed = action.completed, entrydate = action.entry_date, scheduleddate = action.scheduled_date, completeddate = action.completed_date, comments = action.comments }, commandType: CommandType.StoredProcedure);

            string query = "INSERT INTO ActionDetail ('hive_id','completed_by_id','entered_by_id','primary_action_id','secondary_action_id','tertiary_action_id','completed','entry_date','scheduled_date','completed_date','comments') VALUES (@hive_id, @completed_by_id, @entered_by_id, @primary_action_id, @secondary_action_id, @tertiary_action_id, @completed, @entry_date, @scheduled_date, @completed_date, @entry_date)";
            int result =db.Execute(query, new { action.hive_id, action.completed_by_id, action.entered_by_id, action.primary_action_id, action.secondary_action_id, action.tertiary_action_id, action.completed, action.entry_date, action.scheduled_date, action.completed_date, action.comments});
            return result != 0;
        }

        public bool AddHive(Hive add_hive)
        {
            int result = db.Execute("AddHive", new {locationid = add_hive.location_id, inspectioninterval = add_hive.inspection_interval, name = add_hive.name }, commandType: CommandType.StoredProcedure);
            return result != 0;
        }

        public bool AddUser(User new_user)
        {
            int result = db.Execute("AddUser", new { @firstname = new_user.first_name, @lastname = new_user.last_name, @accesslevel = new_user.access_level, @username = new_user.username }, commandType: CommandType.StoredProcedure );
            return result != 0;
        }

        public bool DeleteHive(long id)
        {
            int result = db.Execute("DeleteHive", new { id }, commandType: CommandType.StoredProcedure );
            return result != 0;

        }

        public IEnumerable<ActionDetail> GetActionDetails(long hive_id)
        {
            return db.Query<ActionDetail>("GetActionDetails", new { hive_id }, commandType: CommandType.StoredProcedure);
            
        }

        public IEnumerable<Hive> GetHives(long location_id)
        {
            string query = "SELECT * FROM Hive WHERE location_id = @location_id";
            return db.Query<Hive>(query, new { location_id });            
        }

        public IEnumerable<PrimaryAction> GetPrimaryActions()
        {
            string query = "SELECT * FROM PrimaryAction";
            return db.Query<PrimaryAction>(query);
        }

        public IEnumerable<SecondaryAction> GetSecondaryActions(long primary_id)
        {
            string query = "SELECT * FROM SecondaryAction WHERE primary_action_id = @primary_id";
            return db.Query<SecondaryAction>(query, new { primary_id });
        }

        public IEnumerable<TertiaryAction> GetTertiaryActions(long secondary_id)
        {
            string query = "SELECT * FROM TertiaryAction WHERE secondary_action_id = @secondary_id";
            return db.Query<TertiaryAction>(query, new { secondary_id });
        }

        public User GetUser(string username)
        {
            string query = "SELECT * FROM [User] WHERE username = @username";

            User found;

            try
            {
               found = db.QuerySingle<User>(query, new { username });
            } 
            catch 
            {
                found = null;
            }

            return found;
            
        }

        public Location GetYard(long id)
        {
            string query = "SELECT * FROM Location WHERE id = @id";
            return db.QuerySingle<Location>(query, new { id });
        }

        public IEnumerable<Location> GetYards()
        {
            string query = "SELECT * FROM Location";
            return db.Query<Location>(query);
        }

        public bool UpdateActionDetail(ActionDetail update_action)
        {
            //What we are updating: completed by id, completed status, and completed date
            string query = "UPDATE ActionDetail SET completed_by_id = @completed_by_id, completed = @completed, completed_date = @completed_date WHERE id = @id";
            int results = db.Execute(query, new { update_action.id, update_action.completed_by_id, update_action.completed, update_action.completed_date });
            return results == 1;
        }

        public bool UpdatePrimaryAction(PrimaryAction primary)
        {

            int result = db.Execute("UpdatePrimaryAction", new { id = primary.id, active = primary.active }, commandType: CommandType.StoredProcedure);
            return result == 1;
            //string query = "UPDATE id, active FROM PrimaryAction";

        }

        public bool UpdateSecondaryAction(SecondaryAction secondary)
        {
            int result = db.Execute("UpdateSecondaryAction", new { id = secondary.id, active = secondary.active }, commandType: CommandType.StoredProcedure);
            return result == 1;
            
        }

        public bool UpdateTertiaryAction(TertiaryAction tertiary)
        {
            int result = db.Execute("UpdateTertiaryAction", new { id = tertiary.id, active = tertiary.active }, commandType: CommandType.StoredProcedure);
            return result == 1;
        }
    }
}
